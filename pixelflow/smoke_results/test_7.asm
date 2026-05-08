; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.
LDI r0, 0xFF
AND r2, r0
LDI r0, 0xFF
AND r2, r0
LDI r0, 10
MUL r2, r0
ADD r2, r5
LOAD r6, r2
STORE r6, r6

SUB r5, r6
LDI r6, 0x2000
ADD r6, r2
LOAD r6, r6
STORE r6, r6

ds_skip:
RET

crear_next:
LDI r0, 1
ADD r10, r0
JMP cread_loop

cread_play:
LDI r6, 0x2400
LDI r0, 0
LOAD r6, r0
LDI r9, 0x2401
LOAD r1, r9
LDI r0, 0x2002
STORE r6, r1
CALL append_tr
LDI r1, 0x2402
LOAD r1, r6
LDI r1, 1
ADD r6, r1
STORE r6, r1
JMP cr_next

cread_prog: