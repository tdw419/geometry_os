; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.
LDI r8, 0x3000
LOAD r1, r8
ADDI r1, 1
LDI r5, 0x3000
LDI r6, 0

fill_loop:
CMP r5, r6
JZ r3, fill_done
STORE r8, r1
ADDI r8, 1
ADDI r5, 1
JMP fill_loop

fill_done:
RET

init_respawn_burst:
PUSH r31
PUSH r1
PUSH r5
LDI r16, 1

LDI r15, 0x3000
ADD r15, r5
LOAD r1, r15
ADDI r15, 1
LDI r8, 0x3000
ADD r8, r1
LOAD r2, r8
ADD r15, r1
POP r5
POP r31
RET

init_reset:
PUSH r31
PUSH r3
PUSH r1
PUSH r5
LDI r1, 0
ADD r1, r15
LDI r8, 0x3020
STORE r8, r1
POP r31
RET