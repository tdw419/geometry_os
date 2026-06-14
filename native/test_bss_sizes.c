// Test BSS size limits
#define SBI_CONSOLE_PUTCHAR 1

__attribute__((section(".text._start")))
void _start(void)
{
    __asm__ volatile(
        "li a7, 1\n"
        "li a0, 'O'\n"
        "ecall\n"
        "li a0, 'K'\n"
        "ecall\n"
        "li a0, '\\n'\n"
        "ecall\n"
        "1:\n"
        "wfi\n"
        "j 1b\n"
    );
    while (1) {}
}

// Try 1MB BSS
unsigned int bss_1mb[256*1024] __attribute__((section(".bss"))) __attribute__((aligned(4096)));
