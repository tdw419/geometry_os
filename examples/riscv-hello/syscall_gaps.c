/*
 * syscall_gaps.c -- Test currently-unimplemented Linux syscalls.
 * These should return -ENOSYS (-38) until we implement them.
 * As we add implementations, tests should flip from ENOSYS to success.
 *
 * Build: ./build.sh syscall_gaps.c syscall_gaps.elf
 */

#include <stdint.h>

/* RISC-V Linux asm-generic syscall numbers */
#define SYS_write           64
#define SYS_exit_group      94
#define SYS_fstat           44
#define SYS_newfstatat      79
#define SYS_pread64         67
#define SYS_clock_nanosleep 115
#define SYS_unlinkat        35
#define SYS_mkdirat         39
#define SYS_renameat        38
#define SYS_kill            129
#define SYS_sigaltstack     132
#define SYS_execve          221
#define SYS_waitid          95

/* ---- Inline syscall macros ---- */
#define syscall1(n, a) ({ \
    register long _a0 __asm__("a0") = (long)(a); \
    register long _a7 __asm__("a7") = (n); \
    __asm__ volatile("ecall" : "=r"(_a0) : "r"(_a0), "r"(_a7) : "memory"); \
    _a0; \
})
#define syscall2(n, a, b) ({ \
    register long _a0 __asm__("a0") = (long)(a); \
    register long _a1 __asm__("a1") = (long)(b); \
    register long _a7 __asm__("a7") = (n); \
    __asm__ volatile("ecall" : "=r"(_a0) : "r"(_a0), "r"(_a1), "r"(_a7) : "memory"); \
    _a0; \
})
#define syscall3(n, a, b, c) ({ \
    register long _a0 __asm__("a0") = (long)(a); \
    register long _a1 __asm__("a1") = (long)(b); \
    register long _a2 __asm__("a2") = (long)(c); \
    register long _a7 __asm__("a7") = (n); \
    __asm__ volatile("ecall" : "=r"(_a0) : "r"(_a0), "r"(_a1), "r"(_a2), "r"(_a7) : "memory"); \
    _a0; \
})
#define syscall4(n, a, b, c, d) ({ \
    register long _a0 __asm__("a0") = (long)(a); \
    register long _a1 __asm__("a1") = (long)(b); \
    register long _a2 __asm__("a2") = (long)(c); \
    register long _a3 __asm__("a3") = (long)(d); \
    register long _a7 __asm__("a7") = (n); \
    __asm__ volatile("ecall" : "=r"(_a0) : "r"(_a0), "r"(_a1), "r"(_a2), "r"(_a3), "r"(_a7) : "memory"); \
    _a0; \
})

/* ---- Output via write(2) syscall ---- */
static void raw_write(const char *s, int len) {
    syscall3(SYS_write, 1, (long)s, len);
}

static int slen(const char *s) {
    int n = 0;
    while (s[n]) n++;
    return n;
}

static void puts(const char *s) {
    raw_write(s, slen(s));
}

static void put_dec(int val) {
    char buf[12];
    int i = 0;
    if (val < 0) { puts("-"); val = -val; }
    if (val == 0) { puts("0"); return; }
    while (val > 0 && i < 11) {
        buf[i++] = '0' + (val % 10);
        val /= 10;
    }
    while (--i >= 0) {
        char c = buf[i];
        raw_write(&c, 1);
    }
}

static void put_hex(long val) {
    const char *hex = "0123456789ABCDEF";
    char buf[16];
    int i;
    if (val == 0) { puts("0"); return; }
    for (i = 0; val && i < 16; i++) {
        buf[i] = hex[val & 0xF];
        val >>= 4;
    }
    while (--i >= 0) {
        char c = buf[i];
        raw_write(&c, 1);
    }
}

/* ---- Test harness ---- */
static int test_num = 0;
static int passed = 0;
static int failed = 0;

static void check(const char *name, long result, int expect_success) {
    test_num++;
    if (result == -38) {
        puts("  [ENOSYS] #");
        put_dec(test_num);
        puts(": ");
        puts(name);
        puts("\n");
        passed++;
    } else if (expect_success && result >= 0) {
        puts("  PASS #");
        put_dec(test_num);
        puts(": ");
        puts(name);
        puts("\n");
        passed++;
    } else if (!expect_success && result < 0) {
        puts("  PASS #");
        put_dec(test_num);
        puts(": ");
        puts(name);
        puts(" (err=");
        put_dec((int)result);
        puts(")\n");
        passed++;
    } else {
        puts("  FAIL #");
        put_dec(test_num);
        puts(": ");
        puts(name);
        puts(" (got 0x");
        put_hex(result);
        puts(")\n");
        failed++;
    }
}

void c_start(void) {
    char buf[128];
    long result;
    int i;

    puts("=== Syscall Gap Test ===\n");
    puts("Testing unimplemented syscalls (expect ENOSYS=-38)\n\n");

    /* 1. fstat(44) */
    for (i = 0; i < 128; i++) buf[i] = 0;
    result = syscall2(SYS_fstat, 1, (long)buf);
    check("fstat(1, buf)", result, 1);

    /* 2. newfstatat(79) */
    for (i = 0; i < 128; i++) buf[i] = 0;
    result = syscall4(SYS_newfstatat, -100, (long)"/", (long)buf, 0);
    check("newfstatat(/)", result, 1);

    /* 3. pread64(67) */
    result = syscall4(SYS_pread64, 1, (long)buf, 16, 0);
    check("pread64(1, buf, 16, 0)", result, 1);

    /* 4. clock_nanosleep(115) */
    {
        struct { long sec; long nsec; } ts = { 0, 0 };
        result = syscall4(SYS_clock_nanosleep, 0, (long)&ts, 0, 0);
        check("clock_nanosleep({0,0})", result, 1);
    }

    /* 5. unlinkat(35) */
    result = syscall3(SYS_unlinkat, -100, (long)"/noexist", 0);
    check("unlinkat(/noexist)", result, 0);

    /* 6. mkdirat(39) */
    result = syscall3(SYS_mkdirat, -100, (long)"/test_mkdir", 0x1FF);
    check("mkdirat(/test_mkdir)", result, 1);

    /* 7. renameat(38) */
    result = syscall4(SYS_renameat, -100, (long)"/a", -100, (long)"/b");
    check("renameat(/a -> /b)", result, 0);

    /* 8. kill(129) */
    result = syscall2(SYS_kill, 0, 0);
    check("kill(0, 0)", result, 1);

    /* 9. sigaltstack(132) */
    result = syscall2(SYS_sigaltstack, 0, 0);
    check("sigaltstack(NULL, NULL)", result, 1);

    /* 10. execve(221) */
    result = syscall3(SYS_execve, (long)"/none", 0, 0);
    check("execve(/none)", result, 0);

    /* 11. waitid(261) */
    result = syscall4(SYS_waitid, 0, 0, 0, 0);
    check("waitid(0, 0, NULL, 0)", result, 0);

    /* Summary */
    puts("\n=== Results: ");
    put_dec(passed);
    puts(" passed, ");
    put_dec(failed);
    puts(" failed ===\n");

    if (failed == 0) {
        puts("ALL PASSED\n");
    } else {
        puts("SOME FAILURES\n");
    }

    syscall1(SYS_exit_group, 0);
    for (;;) {}
}
