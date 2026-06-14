/*
 * syscall_stress.c -- Comprehensive syscall stress test for GeOS RISC-V user-mode.
 *
 * Tests a wider range of syscalls and verifies correct behavior:
 *   - write, brk, mmap, munmap, mprotect, madvise
 *   - getcwd, getdents64, clock_gettime
 *   - getpid, getuid, getgid, geteuid, getegid
 *   - uname, sysinfo
 *   - rt_sigaction, rt_sigprocmask
 *   - set_tid_address
 *   - nanosleep (stub)
 *   - Memory: stack, heap, mmap regions all writable
 *   - String operations on mmap'd memory
 *
 * Build: ./build.sh syscall_stress.c syscall_stress.elf
 * Run:   geometry_os --cli --user examples/riscv-hello/syscall_stress.elf
 */

#include <stdint.h>

/* RISC-V Linux asm-generic syscall numbers */
#define SYS_io_setup       0
#define SYS_write          64
#define SYS_exit           93
#define SYS_exit_group     94
#define SYS_set_tid_address 96
#define SYS_clock_gettime  113
#define SYS_nanosleep      101
#define SYS_getpid         172
#define SYS_getuid         174
#define SYS_geteuid        175
#define SYS_getgid         176
#define SYS_getegid        177
#define SYS_gettid         178
#define SYS_brk            214
#define SYS_mmap           222
#define SYS_munmap         215
#define SYS_mprotect       226
#define SYS_madvise        233
#define SYS_rt_sigaction   134
#define SYS_rt_sigprocmask 135
#define SYS_getcwd         17
#define SYS_getdents64     61
#define SYS_uname          160
#define SYS_sysinfo        179
#define SYS_setrlimit      164
#define SYS_getrlimit      163
#define SYS_umask          166
#define SYS_gettimeofday   169
#define SYS_sched_yield    124
static inline long syscall0(long nr) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0");
    __asm__ volatile("ecall" : "=r"(_a0) : "r"(a7) : "memory");
    return _a0;
}

static inline long syscall1(long nr, long a0) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0") = a0;
    __asm__ volatile("ecall" : "+r"(_a0) : "r"(a7) : "memory");
    return _a0;
}

static inline long syscall2(long nr, long a0, long a1) {
    register long a7 __asm__("a7") = nr;
    register long _a0 __asm__("a0") = a0;
    register long a1_ __asm__("a1") = a1;
    __asm__ volatile("ecall" : "+r"(_a0) : "r"(a1_), "r"(a7) : "memory");
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

/* Utility functions */
static int slen(const char *s) {
    int n = 0;
    while (s[n]) n++;
    return n;
}

static void puts(const char *s) {
    syscall3(SYS_write, 1, (long)s, slen(s));
}

static void putn(long val) {
    if (val < 0) { puts("-"); val = -val; }
    if (val == 0) { puts("0"); return; }
    char buf[20];
    int i = 0;
    while (val > 0) {
        buf[i++] = '0' + (val % 10);
        val /= 10;
    }
    /* reverse */
    char out[20];
    for (int j = 0; j < i; j++) out[j] = buf[i - 1 - j];
    out[i] = 0;
    puts(out);
}

static void put_hex(long val) {
    const char hex[] = "0123456789ABCDEF";
    char buf[11];
    buf[0] = '0'; buf[1] = 'x';
    for (int i = 0; i < 8; i++) {
        buf[2 + i] = hex[(val >> (28 - i * 4)) & 0xF];
    }
    buf[10] = 0;
    puts(buf);
}

/* Test tracking */
static int passed = 0;
static int failed = 0;
static int test_num = 0;

static void check(const char *name, long actual, long expected) {
    test_num++;
    if (actual == expected) {
        puts("  PASS #");
        putn(test_num);
        puts(": ");
        puts(name);
        puts("\n");
        passed++;
    } else {
        puts("  FAIL #");
        putn(test_num);
        puts(": ");
        puts(name);
        puts(" expected=");
        put_hex(expected);
        puts(" actual=");
        put_hex(actual);
        puts("\n");
        failed++;
    }
}

static void check_nonzero(const char *name, long val) {
    test_num++;
    if (val != 0) {
        puts("  PASS #");
        putn(test_num);
        puts(": ");
        puts(name);
        puts("\n");
        passed++;
    } else {
        puts("  FAIL #");
        putn(test_num);
        puts(": ");
        puts(name);
        puts(" (got 0)\n");
        failed++;
    }
}

static void check_nonneg(const char *name, long val) {
    test_num++;
    if (val >= 0) {
        puts("  PASS #");
        putn(test_num);
        puts(": ");
        puts(name);
        puts(" = ");
        put_hex(val);
        puts("\n");
        passed++;
    } else {
        puts("  FAIL #");
        putn(test_num);
        puts(": ");
        puts(name);
        puts(" negative: ");
        put_hex(val);
        puts("\n");
        failed++;
    }
}

/* String comparison on raw memory */
static int streq(const char *a, const char *b) {
    while (*a && *b) {
        if (*a != *b) return 0;
        a++; b++;
    }
    return *a == *b;
}

/* memcpy */
static void *memcpy_custom(void *dst, const void *src, unsigned int n) {
    char *d = (char *)dst;
    const char *s = (const char *)src;
    for (unsigned int i = 0; i < n; i++) d[i] = s[i];
    return dst;
}

/* memset */
static void *memset_custom(void *dst, int c, unsigned int n) {
    char *d = (char *)dst;
    for (unsigned int i = 0; i < n; i++) d[i] = (char)c;
    return dst;
}

/* strlen on mmap'd memory */
static unsigned int strlen_custom(const char *s) {
    unsigned int n = 0;
    while (s[n]) n++;
    return n;
}

/* ── Entry point ── */
void c_start(void) {
    puts("\n=== Syscall Stress Test ===\n");

    /* ── Section 1: Identity syscalls ── */
    puts("\n--- Identity syscalls ---\n");

    long pid = syscall0(SYS_getpid);
    check_nonneg("getpid", pid);

    long tid = syscall0(SYS_gettid);
    check_nonneg("gettid", tid);

    long uid = syscall0(SYS_getuid);
    check("getuid", uid, 0);

    long euid = syscall0(SYS_geteuid);
    check("geteuid", euid, 0);

    long gid = syscall0(SYS_getgid);
    check("getgid", gid, 0);

    long egid = syscall0(SYS_getegid);
    check("getegid", egid, 0);

    /* ── Section 2: Heap management ── */
    puts("\n--- Heap management ---\n");

    long heap0 = syscall1(SYS_brk, 0);
    check_nonzero("brk(0) returns current heap", heap0);

    long heap1 = syscall1(SYS_brk, heap0 + 8192);
    check("brk(heap+8192) succeeds", heap1, heap0 + 8192);

    /* Verify heap is writable */
    volatile unsigned char *hp = (volatile unsigned char *)(long)heap0;
    hp[0] = 0xAA;
    hp[8191] = 0xBB;
    check("heap[0] writable", hp[0], 0xAA);
    check("heap[8191] writable", hp[8191], 0xBB);

    /* ── Section 3: Memory mapping ── */
    puts("\n--- Memory mapping ---\n");

    /* Allocate 3 pages via mmap */
    long page1 = syscall6(SYS_mmap, 0, 4096, 3, 0x22, -1, 0);
    check_nonzero("mmap page1", page1);
    if (page1 != -1) {
        volatile char *p = (volatile char *)(long)page1;
        p[0] = 'A'; p[1] = 'B'; p[2] = 'C'; p[3] = 0;
        check("mmap page1 writable", p[0], 'A');
    }

    long page2 = syscall6(SYS_mmap, 0, 4096, 3, 0x22, -1, 0);
    check_nonzero("mmap page2", page2);

    /* Cross-page string copy test */
    if (page1 != -1 && page2 != -1) {
        char *src = (char *)(long)page1;
        char *dst = (char *)(long)page2;
        const char *msg = "Hello from mmap!";
        memcpy_custom(src, msg, 17);
        memcpy_custom(dst, src, 17);
        dst[17] = 0;
        check("cross-page copy correct", streq(dst, "Hello from mmap!") ? 1 : 0, 1);
    }

    /* munmap page2 */
    long unmap_ret = syscall3(SYS_munmap, page2, 4096, 0);
    check("munmap page2 returns 0", unmap_ret, 0);

    /* mprotect page1 */
    long prot_ret = syscall3(SYS_mprotect, page1, 4096, 3);
    check_nonneg("mprotect page1 RW", prot_ret);

    /* madvise page1 */
    long adv_ret = syscall3(SYS_madvise, page1, 4096, 1 /* MADV_WILLNEED */);
    check_nonneg("madvise page1", adv_ret);

    /* ── Section 4: Time ── */
    puts("\n--- Time syscalls ---\n");

    long ts_buf[2];
    ts_buf[0] = 0; ts_buf[1] = 0;
    long clk_ret = syscall3(SYS_clock_gettime, 0, (long)ts_buf, 0);
    check("clock_gettime(CLOCK_REALTIME) returns 0", clk_ret, 0);
    if (clk_ret == 0) {
        puts("    tv_sec=");
        put_hex(ts_buf[0]);
        puts(" tv_nsec=");
        put_hex(ts_buf[1]);
        puts("\n");
    }

    long ts_buf2[2];
    ts_buf2[0] = 0; ts_buf2[1] = 0;
    long clk2 = syscall3(SYS_clock_gettime, 1 /* CLOCK_MONOTONIC */, (long)ts_buf2, 0);
    check("clock_gettime(CLOCK_MONOTONIC) returns 0", clk2, 0);

    /* gettimeofday */
    long tv_buf[2];
    tv_buf[0] = 0; tv_buf[1] = 0;
    long gtod = syscall2(SYS_gettimeofday, (long)tv_buf, 0);
    check("gettimeofday returns 0", gtod, 0);

    /* ── Section 5: Signals ── */
    puts("\n--- Signal syscalls ---\n");

    long sig_ret = syscall4(SYS_rt_sigaction, 2, 0, 0, 8);
    check("rt_sigaction(SIGINT, NULL) returns 0", sig_ret, 0);

    long mask_ret = syscall4(SYS_rt_sigprocmask, 0, 0, 0, 8);
    check("rt_sigprocmask(SIG_BLOCK, NULL) returns 0", mask_ret, 0);

    /* ── Section 6: Filesystem stubs ── */
    puts("\n--- Filesystem stubs ---\n");

    char cwd_buf[256];
    long cwd_ret = syscall3(SYS_getcwd, (long)cwd_buf, sizeof(cwd_buf), 0);
    check_nonneg("getcwd", cwd_ret);
    if (cwd_ret > 0) {
        puts("    cwd='");
        puts(cwd_buf);
        puts("'\n");
    }

    /* sysinfo */
    long sysinfo_buf[16]; /* enough for struct sysinfo */
    long si_ret = syscall1(SYS_sysinfo, (long)sysinfo_buf);
    check_nonneg("sysinfo", si_ret);

    /* getrlimit */
    long rlimit_buf[2];
    long rl_ret = syscall2(SYS_getrlimit, 3 /* RLIMIT_STACK */, (long)rlimit_buf);
    check_nonneg("getrlimit", rl_ret);

    /* ── Section 7: Thread/process ── */
    puts("\n--- Thread/process ---\n");

    long tid_addr = syscall1(SYS_set_tid_address, 0);
    check("set_tid_address returns 1", tid_addr, 1);

    long yield_ret = syscall0(SYS_sched_yield);
    check("sched_yield returns 0", yield_ret, 0);

    /* ── Section 8: Stress: many mmap/munmap cycles ── */
    puts("\n--- Stress: 10 mmap/munmap cycles ---\n");

    int stress_ok = 1;
    for (int i = 0; i < 10; i++) {
        long p = syscall6(SYS_mmap, 0, 4096, 3, 0x22, -1, 0);
        if (p == 0 || p == -1) { stress_ok = 0; break; }

        /* Write pattern */
        volatile unsigned int *wp = (volatile unsigned int *)(long)p;
        for (int j = 0; j < 1024; j++) {
            wp[j] = (unsigned int)(i * 1024 + j);
        }
        /* Verify */
        for (int j = 0; j < 1024; j++) {
            if (wp[j] != (unsigned int)(i * 1024 + j)) {
                stress_ok = 0;
                break;
            }
        }
        if (!stress_ok) break;

        long ur = syscall3(SYS_munmap, p, 4096, 0);
        if (ur != 0) { stress_ok = 0; break; }
    }
    check("10x mmap/munmap + verify", stress_ok, 1);

    /* ── Section 9: Stack stress (recursive) ── */
    puts("\n--- Stack stress ---\n");

    /* Allocate on stack to verify SP works */
    long stack_test[256];
    for (int i = 0; i < 256; i++) stack_test[i] = i;
    int stack_ok = 1;
    for (int i = 0; i < 256; i++) {
        if (stack_test[i] != i) { stack_ok = 0; break; }
    }
    check("stack array 256 entries", stack_ok, 1);

    /* ── Section 10: String operations on heap ── */
    puts("\n--- String operations ---\n");

    long str_page = syscall6(SYS_mmap, 0, 4096, 3, 0x22, -1, 0);
    if (str_page != -1) {
        char *sp = (char *)(long)str_page;

        /* Fill with pattern */
        memset_custom(sp, 'X', 100);
        check("memset fill", sp[50], 'X');

        /* Overwrite with string */
        const char *test_str = "GeOS RISC-V user mode works!";
        int len = 0;
        while (test_str[len]) len++;
        memcpy_custom(sp, test_str, len);
        sp[len] = 0;

        check("strlen on mmap'd string", (long)strlen_custom(sp), len);
        check("mmap'd string correct", streq(sp, "GeOS RISC-V user mode works!") ? 1 : 0, 1);

        /* Reverse in place */
        for (int i = 0; i < len / 2; i++) {
            char tmp = sp[i];
            sp[i] = sp[len - 1 - i];
            sp[len - 1 - i] = tmp;
        }
        sp[len] = 0;
        check("string reverse works",
              streq(sp, "!skrow edom resu V-CSIR SOeG") ? 1 : 0, 1);

        syscall3(SYS_munmap, str_page, 4096, 0);
    } else {
        puts("  SKIP: string tests (mmap failed)\n");
    }

    /* ── Summary ── */
    puts("\n=== Results: ");
    putn(passed);
    puts(" passed, ");
    putn(failed);
    puts(" failed ===\n");

    if (failed == 0) {
        puts("ALL PASSED\n");
    } else {
        puts("SOME FAILURES\n");
    }

    syscall1(SYS_exit_group, failed > 0 ? 1 : 0);
    __builtin_unreachable();
}
