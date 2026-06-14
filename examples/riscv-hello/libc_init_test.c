/*
 * libc_init_test.c -- Exercise the "Libc Initialization Five" syscalls
 * that glibc/musl fire during startup.
 *
 * Tests: brk, set_tid_address, exit_group, mmap, rt_sigaction,
 *         rt_sigprocmask, write, getcwd, getdents64, clock_gettime
 *
 * Build: ./build.sh libc_init_test.c libc_init_test.elf
 * Run:   riscv run --user examples/riscv-hello/libc_init_test.elf
 */

#include <stdint.h>

/* RISC-V Linux asm-generic syscall numbers (RV32 uses the same table) */
#define SYS_write       64
#define SYS_exit        93
#define SYS_exit_group  94
#define SYS_set_tid_address 96
#define SYS_clock_gettime   113
#define SYS_brk        214
#define SYS_mmap       222
#define SYS_munmap     215
#define SYS_rt_sigaction    134
#define SYS_rt_sigprocmask  135
#define SYS_getcwd     17
#define SYS_getdents64 61

static inline long syscall1(long nr, long a0) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0") = a0;
    __asm__ volatile("ecall" : "+r"(_a0) : "r"(a7) : "memory");
    return _a0;
}

static inline long syscall3(long nr, long a0, long a1, long a2) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0") = a0;
    register long a1_ __asm__("a1") = a1;
    register long a2_ __asm__("a2") = a2;
    __asm__ volatile("ecall"
        : "+r"(_a0)
        : "r"(a1_), "r"(a2_), "r"(a7)
        : "memory");
    return _a0;
}

static inline long syscall4(long nr, long a0, long a1, long a2, long a3) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0") = a0;
    register long a1_ __asm__("a1") = a1;
    register long a2_ __asm__("a2") = a2;
    register long a3_ __asm__("a3") = a3;
    __asm__ volatile("ecall"
        : "+r"(_a0)
        : "r"(a1_), "r"(a2_), "r"(a3_), "r"(a7)
        : "memory");
    return _a0;
}

static inline long syscall6(long nr, long a0, long a1, long a2, long a3, long a4, long a5) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0") = a0;
    register long a1_ __asm__("a1") = a1;
    register long a2_ __asm__("a2") = a2;
    register long a3_ __asm__("a3") = a3;
    register long a4_ __asm__("a4") = a4;
    register long a5_ __asm__("a5") = a5;
    __asm__ volatile("ecall"
        : "+r"(_a0)
        : "r"(a1_), "r"(a2_), "r"(a3_), "r"(a4_), "r"(a5_), "r"(a7)
        : "memory");
    return _a0;
}

static void puts(const char *s) {
    int len = 0;
    while (s[len]) len++;
    syscall3(SYS_write, 1, (long)s, len);
}

static void put_hex(long val) {
    const char hex[] = "0123456789ABCDEF";
    char buf[11];
    buf[0] = '0'; buf[1] = 'x';
    for (int i = 0; i < 8; i++) {
        buf[2 + i] = hex[(val >> (28 - i * 4)) & 0xF];
    }
    buf[10] = '\0';
    puts(buf);
}

static int tests_passed = 0;
static int tests_failed = 0;

static void check(const char *name, long actual, long expected) {
    if (actual == expected) {
        puts("  PASS: ");
        puts(name);
        puts("\n");
        tests_passed++;
    } else {
        puts("  FAIL: ");
        puts(name);
        puts(" expected=");
        put_hex(expected);
        puts(" actual=");
        put_hex(actual);
        puts("\n");
        tests_failed++;
    }
}

/* Entry point -- called from crt0.S as c_start */
void c_start(void) {
    puts("=== Libc Init Syscall Test ===\n");

    /* 1. brk(0) -- query current heap end */
    long heap = syscall1(SYS_brk, 0);
    puts("1. brk(0) = ");
    put_hex(heap);
    puts("\n");
    check("brk(0) returns non-zero", heap != 0 ? 1 : 0, 1);

    /* 1b. brk(addr) -- set heap higher */
    long new_heap = heap + 4096;
    long brk_ret = syscall1(SYS_brk, new_heap);
    check("brk(heap+4096) returns new value", brk_ret, new_heap);

    /* 2. set_tid_address -- should return tid (1) */
    long tid = syscall1(SYS_set_tid_address, 0);
    check("set_tid_address returns 1", tid, 1);

    /* 3. rt_sigaction -- install dummy handler */
    long sig_ret = syscall4(SYS_rt_sigaction, 2 /* SIGINT */, 0, 0, 8);
    check("rt_sigaction returns 0", sig_ret, 0);

    /* 4. rt_sigprocmask -- query signal mask */
    long mask_ret = syscall4(SYS_rt_sigprocmask, 0, 0, 0, 8);
    check("rt_sigprocmask returns 0", mask_ret, 0);

    /* 5. mmap -- allocate a page */
    long page = syscall6(SYS_mmap, 0, 4096, 3 /* PROT_READ|PROT_WRITE */,
                         0x22 /* MAP_PRIVATE|MAP_ANONYMOUS */, -1, 0);
    puts("5. mmap(4096) = ");
    put_hex(page);
    puts("\n");
    check("mmap returns non-MAP_FAILED", page != 0 && page != -1 ? 1 : 0, 1);

    /* 5b. Write to mmap'd page to verify it's accessible */
    if (page > 0 && page < 0x7FFFFFFF) {
        volatile unsigned char *p = (volatile unsigned char *)(long)page;
        p[0] = 0x42;
        p[4095] = 0x43;
        check("mmap page writable (byte 0)", p[0], 0x42);
        check("mmap page writable (byte 4095)", p[4095], 0x43);
    }

    /* 6. munmap */
    long unmap_ret = syscall3(SYS_munmap, page, 4096, 0);
    check("munmap returns 0", unmap_ret, 0);

    /* 7. getcwd */
    char cwd_buf[128];
    long cwd_ret = syscall3(SYS_getcwd, (long)cwd_buf, sizeof(cwd_buf), 0);
    puts("7. getcwd = '");
    /* cwd_ret is the length including NUL */
    if (cwd_ret > 0) {
        for (int i = 0; i < cwd_ret - 1; i++) {
            /* write char by char to avoid issues */
            char c[2];
            c[0] = cwd_buf[i];
            c[1] = 0;
            puts(c);
        }
    }
    puts("'\n");
    check("getcwd returns positive", cwd_ret > 0 ? 1 : 0, 1);

    /* 8. clock_gettime */
    /* struct timespec: { tv_sec: long, tv_nsec: long } = 8 bytes on RV32 */
    long ts_buf[2];
    ts_buf[0] = 0;
    ts_buf[1] = 0;
    long clk_ret = syscall3(SYS_clock_gettime, 0 /* CLOCK_REALTIME */, (long)ts_buf, 0);
    check("clock_gettime returns 0", clk_ret, 0);
    if (clk_ret == 0) {
        puts("   tv_sec=");
        put_hex(ts_buf[0]);
        puts("\n");
    }

    /* Summary */
    puts("\n=== Results: ");
    put_hex(tests_passed);
    puts(" passed, ");
    put_hex(tests_failed);
    puts(" failed ===\n");

    /* 9. exit_group -- this is the real test */
    if (tests_failed == 0) {
        puts("ALL PASSED\n");
    } else {
        puts("SOME FAILURES\n");
    }

    syscall1(SYS_exit_group, tests_failed > 0 ? 1 : 0);
    __builtin_unreachable();
}
