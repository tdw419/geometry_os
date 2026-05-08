; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it generates random numbers, performs modular arithmetic to categorize them, and stores the results in memory. The loop continues until a specific condition is met, at which point the program halts.

; Test label resolution
    LDI r3, 1
    LDI r20, 64
loop_start:
    RAND r0
    LDI r9, 3
    MOD r0, r9
    CMPI r0, 0
    JNZ r13, mid_case
    CMPI r0, 1
    JNZ r13, dark_case
    LDI r0, 1
    JMP store_it
mid_case:
    LDI r0, 2
    JMP store_it
dark_case:
    LDI r0, 3
store_it:
    STORE r20, r0
    ADD r20, r3
    SUB r21, r3
    CMPI r21, 0
    JNZ r13, loop_start
    HALT
