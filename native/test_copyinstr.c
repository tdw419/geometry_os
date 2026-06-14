// Standalone test for copyinstr fix
// Verifies the double-offset fix in geos_stubs.c line 1129
//
// Compile:
//   riscv64-unknown-elf-gcc -static -nostdlib -nostartfiles -march=rv64im_zicsr -mabi=lp64 \
//     -mcmodel=medany -T test_copyinstr.ld -o test_copyinstr.elf test_copyinstr.c
//
// Run under QEMU:
//   qemu-system-riscv64 -nographic -machine virt -m 256M -bios default -kernel test_copyinstr.elf

// Forward declarations
void uart_putc(char c);
void uart_puts(const char *s);
int run_tests(void);

// ── Entry point MUST be first function (at 0x80200000) ──
// OpenSBI jumps to the LOAD segment base address, not the ELF entry point.
// Putting _start first ensures 0x80200000 = _start.
__attribute__((section(".text._start")))
void _start(void)
{
    // Set up stack pointer (near top of RAM, below FDT at 0x8fe00000)
    __asm__ volatile("li sp, 0x8fc00000");

    // First character to verify boot
    __asm__ volatile(
        "li a7, 1\n"
        "li a0, 'B'\n"
        "ecall\n"
    );

    // Disable all S-mode interrupts
    __asm__ volatile("csrw sie, zero");

    // Clear BSS
    extern unsigned int __bss_start;
    extern unsigned int __bss_end;
    for (unsigned int *p = &__bss_start; p < &__bss_end; p++) {
        *p = 0;
    }

    // Second character to verify BSS cleared
    __asm__ volatile(
        "li a7, 1\n"
        "li a0, 'C'\n"
        "ecall\n"
    );

    // Call test runner
    uart_puts("tests starting\n");
    int result = run_tests();
    (void)result;
    uart_puts("tests done\n");
    __asm__ volatile(
        "li a7, 1\n"
        "li a0, 'X'\n"
        "ecall\n"
        "1:\n"
        "wfi\n"
        "j 1b\n"
    );
    while (1) {}
}

// ── SBI ecall helper ──
#define SBI_CONSOLE_PUTCHAR 1

static void sbi_ecall_putchar(char c)
{
    register unsigned long a7 asm("a7") = SBI_CONSOLE_PUTCHAR;
    register unsigned long a0 asm("a0") = c;
    __asm__ volatile("ecall" : "+r"(a0) : "r"(a7) : "memory");
}

void uart_putc(char c) {
    sbi_ecall_putchar(c);
}

void uart_puts(const char *s) {
    while (*s) uart_putc(*s++);
}

// ── Page table definitions (matching geos_stubs.c) ──
#define PTE_V     1
#define PTE_R     (1 << 1)
#define PTE_W     (1 << 2)
#define PTE_X     (1 << 3)
#define PTE_U     (1 << 4)
#define PTE_G     (1 << 5)
#define PTE_A     (1 << 6)
#define PTE_D     (1 << 7)
#define PTE_RSW   (3 << 8)
#define PTE_PPN_SHIFT 10
#define PTE_PPN_MASK 0x3FFFFFC00ULL
#define PTE_PPN(pte) (((pte) >> 10) & 0xFFFFF)

#define VPN1(va) (((va) >> 22) & 0x3FF)
#define VPN0(va) (((va) >> 12) & 0x3FF)

// 4MB BSS array — page-aligned for correct page table physical addresses
unsigned int mem[1024*1024] __attribute__((section(".bss"))) __attribute__((aligned(4096)));

// ── FIXED copyinstr ──
__attribute__((noinline))
int copyinstr_fixed(unsigned int srcva, char *dst, unsigned int max, unsigned int *pagetable)
{
    unsigned int *pagetable_phys = (unsigned int *)pagetable;

    unsigned int vpn1 = (srcva >> 22) & 0x3FF;
    unsigned int vpn0 = (srcva >> 12) & 0x3FF;
    unsigned int offset = srcva & 0xFFF;

    unsigned int l1_pte = pagetable_phys[vpn1];
    if (!(l1_pte & 1)) return -1;

    unsigned int *l2_table = (unsigned int *)(unsigned long)(PTE_PPN(l1_pte) << 12);

    unsigned int l2_pte = l2_table[vpn0];
    if (!(l2_pte & 1)) return -1;

    // FIXED: no offset here — handled by current_offset in loop
    char *phys_src = (char *)(unsigned long)((PTE_PPN(l2_pte) << 12));

    unsigned int i;
    for (i = 0; i < max - 1; i++) {
        unsigned int current_offset = (srcva + i) & 0xFFF;
        if (current_offset == 0 && i > 0) {
            unsigned int new_va = srcva + i;
            vpn1 = (new_va >> 22) & 0x3FF;
            vpn0 = (new_va >> 12) & 0x3FF;

            l1_pte = pagetable_phys[vpn1];
            if (!(l1_pte & 1)) return -1;

            l2_table = (unsigned int *)(unsigned long)(PTE_PPN(l1_pte) << 12);
            l2_pte = l2_table[vpn0];
            if (!(l2_pte & 1)) return -1;

            phys_src = (char *)(unsigned long)(PTE_PPN(l2_pte) << 12);
        }

        char c = phys_src[current_offset];
        dst[i] = c;
        if (c == '\0') return 0;
    }
    dst[i] = '\0';
    return 0;
}

// ── BUGGY copyinstr (for comparison) ──
__attribute__((noinline))
int copyinstr_buggy(unsigned int srcva, char *dst, unsigned int max, unsigned int *pagetable)
{
    unsigned int *pagetable_phys = (unsigned int *)pagetable;

    unsigned int vpn1 = (srcva >> 22) & 0x3FF;
    unsigned int vpn0 = (srcva >> 12) & 0x3FF;

    unsigned int l1_pte = pagetable_phys[vpn1];
    if (!(l1_pte & 1)) return -1;

    unsigned int *l2_table = (unsigned int *)(unsigned long)(PTE_PPN(l1_pte) << 12);
    unsigned int l2_pte = l2_table[vpn0];
    if (!(l2_pte & 1)) return -1;

    // BUG: offset applied here AND in loop's current_offset
    char *phys_src = (char *)(unsigned long)((PTE_PPN(l2_pte) << 12) + ((srcva + 0) & 0xFFF));

    unsigned int i;
    for (i = 0; i < max - 1; i++) {
        unsigned int current_offset = (srcva + i) & 0xFFF;
        if (current_offset == 0 && i > 0) {
            unsigned int new_va = srcva + i;
            vpn1 = (new_va >> 22) & 0x3FF;
            vpn0 = (new_va >> 12) & 0x3FF;

            l1_pte = pagetable_phys[vpn1];
            if (!(l1_pte & 1)) return -1;

            l2_table = (unsigned int *)(unsigned long)(PTE_PPN(l1_pte) << 12);
            l2_pte = l2_table[vpn0];
            if (!(l2_pte & 1)) return -1;

            // BUG: offset applied again
            phys_src = (char *)(unsigned long)((PTE_PPN(l2_pte) << 12) + ((srcva + i) & 0xFFF));
        }

        char c = phys_src[current_offset];
        dst[i] = c;
        if (c == '\0') return 0;
    }
    dst[i] = '\0';
    return 0;
}

// ── Page table setup ──
// Maps VA[0..0x3FFFFF] -> PA[mem_base..mem_base+0x3FFFFF]
unsigned int setup_page_table(unsigned int *mem_base)
{
    unsigned int l1_ppn = 0x100;   // L1 at RAM offset 0x100000
    unsigned int l2_ppn = 0x101;   // L2 at RAM offset 0x101000

    unsigned long phys_base = (unsigned long)mem_base;
    unsigned long l1_pa = phys_base + (l1_ppn << 12);
    unsigned long l2_pa = phys_base + (l2_ppn << 12);

    unsigned int *l1_table = (unsigned int *)l1_pa;
    unsigned int *l2_table = (unsigned int *)l2_pa;

    for (int i = 0; i < 1024; i++) {
        l1_table[i] = 0;
        l2_table[i] = 0;
    }

    // Map all VPN0 entries in VPN1=0 to phys_base-based addresses
    for (int i = 0; i < 1024; i++) {
        unsigned long pa = phys_base + (i << 12);
        l2_table[i] = ((pa >> 12) << PTE_PPN_SHIFT) | PTE_V | PTE_R | PTE_W | PTE_X;
    }

    // L1[0] -> L2 table at its physical address
    l1_table[0] = ((l2_pa >> 12) << PTE_PPN_SHIFT) | PTE_V | PTE_R | PTE_W;

    return (unsigned int)l1_pa;
}

// ── String comparison helper ──
int str_eq(const char *a, const char *b, int maxlen)
{
    for (int i = 0; i < maxlen; i++) {
        if (a[i] != b[i]) return 0;
        if (a[i] == '\0') return 1;
    }
    return a[maxlen-1] == '\0';
}

// ── Test runner ──
int run_tests(void)
{
    unsigned int pagetable = setup_page_table((unsigned int *)mem);
    char dst_fixed[64], dst_buggy[64];
    int all_ok = 1;

    uart_puts("copyinstr runtime test\n");
    uart_puts("======================\n");

    // Test 1: Single-page read
    uart_puts("\n[Test 1: Single-page string copy]\n");
    const char *s1 = "/bin/sh";
    char *phys_s1 = (char *)mem + 0x100;
    for (int i = 0; i <= 7; i++) phys_s1[i] = s1[i];

    int ret = copyinstr_fixed(0x100, dst_fixed, 64, (unsigned int *)pagetable);
    if (ret != 0) { uart_puts("FAIL: fixed returned error\n"); all_ok = 0; }
    else if (!str_eq(dst_fixed, s1, 8)) {
        uart_puts("FAIL: fixed got '");
        uart_puts(dst_fixed);
        uart_puts("' expected '/bin/sh'\n");
        all_ok = 0;
    } else {
        uart_puts("PASS: fixed reads '/bin/sh' at VA 0x100\n");
    }

    // Test 2: Non-aligned string (offset 0x050)
    uart_puts("\n[Test 2: String at non-zero page offset 0x050]\n");
    const char *s2 = "clear";
    char *phys_s2 = (char *)mem + 0x050;
    for (int i = 0; i <= 5; i++) phys_s2[i] = s2[i];

    ret = copyinstr_fixed(0x050, dst_fixed, 64, (unsigned int *)pagetable);
    if (ret != 0) { uart_puts("FAIL: fixed returned error\n"); all_ok = 0; }
    else if (!str_eq(dst_fixed, s2, 6)) {
        uart_puts("FAIL: fixed got '");
        uart_puts(dst_fixed);
        uart_puts("' expected 'clear'\n");
        all_ok = 0;
    } else {
        uart_puts("PASS: fixed reads 'clear' at VA 0x050\n");
    }

    // Test 3: Buggy vs fixed comparison at offset 0x050
    uart_puts("\n[Test 3: Buggy vs fixed at offset 0x050]\n");
    copyinstr_buggy(0x050, dst_buggy, 64, (unsigned int *)pagetable);

    if (str_eq(dst_fixed, s2, 6) && !str_eq(dst_buggy, s2, 6)) {
        uart_puts("PASS: fixed='");
        uart_puts(dst_fixed);
        uart_puts("' buggy='");
        uart_puts(dst_buggy);
        uart_puts("'\n");
    } else if (str_eq(dst_fixed, dst_buggy, 64)) {
        uart_puts("FAIL: fixed and buggy give same result\n");
        all_ok = 0;
    } else {
        uart_puts("INFO: fixed='");
        uart_puts(dst_fixed);
        uart_puts("' buggy='");
        uart_puts(dst_buggy);
        uart_puts("'\n");
    }

    // Test 4: Page-crossing string
    uart_puts("\n[Test 4: String crossing page boundary (VA 0xFF8)]\n");
    const char *s4 = "long_file";
    char *phys_s4_p0 = (char *)mem + 0xFF8;
    char *phys_s4_p1 = (char *)mem + 0x1000;
    for (int i = 0; i < 8; i++) phys_s4_p0[i] = s4[i];
    phys_s4_p1[0] = s4[8];
    phys_s4_p1[1] = '\0';

    ret = copyinstr_fixed(0xFF8, dst_fixed, 64, (unsigned int *)pagetable);
    if (ret != 0) { uart_puts("FAIL: fixed returned error\n"); all_ok = 0; }
    else if (!str_eq(dst_fixed, s4, 10)) {
        uart_puts("FAIL: fixed got '");
        uart_puts(dst_fixed);
        uart_puts("' expected 'long_file'\n");
        all_ok = 0;
    } else {
        uart_puts("PASS: fixed reads 'long_file' across page boundary\n");
    }

    // Test 5: Buggy page-crossing
    uart_puts("\n[Test 5: Buggy version at page boundary 0xFF8]\n");
    copyinstr_buggy(0xFF8, dst_buggy, 64, (unsigned int *)pagetable);
    uart_puts("buggy read: '");
    uart_puts(dst_buggy);
    uart_puts("'\n");

    if (str_eq(dst_fixed, s4, 10) && !str_eq(dst_buggy, s4, 10)) {
        uart_puts("PASS: buggy version corrupts page-crossing strings as expected\n");
    }

    // Test 6: Original bug pattern: "sh" -> "h"
    uart_puts("\n[Test 6: Original bug - 'sh' at VA 0x010]\n");
    const char *s6 = "sh";
    char *phys_s6 = (char *)mem + 0x010;
    phys_s6[0] = 's'; phys_s6[1] = 'h'; phys_s6[2] = '\0';

    char *phys_s6b = (char *)mem + 0x020;
    phys_s6b[0] = 'X'; phys_s6b[1] = 'X'; phys_s6b[2] = '\0';

    copyinstr_fixed(0x010, dst_fixed, 64, (unsigned int *)pagetable);
    copyinstr_buggy(0x010, dst_buggy, 64, (unsigned int *)pagetable);

    uart_puts("fixed: '");
    uart_puts(dst_fixed);
    uart_puts("' buggy: '");
    uart_puts(dst_buggy);
    uart_puts("'\n");

    if (str_eq(dst_fixed, s6, 3)) {
        uart_puts("PASS: fixed reads 'sh'\n");
    } else {
        uart_puts("FAIL: fixed should read 'sh'\n");
        all_ok = 0;
    }

    // Summary
    uart_puts("\n======================\n");
    if (all_ok) {
        uart_puts("ALL TESTS PASSED\n");
    } else {
        uart_puts("SOME TESTS FAILED\n");
    }

    return all_ok ? 0 : 1;
}
