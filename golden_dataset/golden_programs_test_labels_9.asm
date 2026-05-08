; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it generates random numbers, performs modular arithmetic to categorize them, and stores the results in memory. The loop continues until a specific condition is met, at which point the program halts.

; Test label resolution
    LDI r15, 1
    LDI r20, 64
loop_start:
    RAND r13
    LDI r7, 3
    MOD r13, r7
    CMPI r13, 0
    JNZ r6, mid_case
    CMPI r13, 1
    JNZ r6, dark_case
    LDI r13, 1
    JMP store_it
mid_case:
    LDI r13, 2
    JMP store_it
dark_case:
    LDI r13, 3
store_it:
    STORE r20, r13
    ADD r20, r15
    SUB r21, r15
    CMPI r21, 0
    JNZ r6, loop_start
    HALT
