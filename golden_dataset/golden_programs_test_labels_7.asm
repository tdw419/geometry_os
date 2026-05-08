; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it generates random numbers, performs modular arithmetic to categorize them, and stores the results in memory. The loop continues until a specific condition is met, at which point the program halts.

; Test label resolution
    LDI r8, 1
    LDI r20, 64
loop_start:
    RAND r1
    LDI r14, 3
    MOD r1, r14
    CMPI r1, 0
    JNZ r6, mid_case
    CMPI r1, 1
    JNZ r6, dark_case
    LDI r1, 1
    JMP store_it
mid_case:
    LDI r1, 2
    JMP store_it
dark_case:
    LDI r1, 3
store_it:
    STORE r20, r1
    ADD r20, r8
    SUB r21, r8
    CMPI r21, 0
    JNZ r6, loop_start
    HALT
