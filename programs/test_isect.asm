; Test intersection math for center pixel
LDI r7, 1
; Sphere at (0,0,32), r_sq=256
LDI r14, 0x2000
LDI r15, 0
STORE r14, r15
ADD r14, r7
STORE r14, r15
ADD r14, r7
LDI r15, 32
STORE r14, r15
ADD r14, r7
LDI r15, 256
STORE r14, r15
; Ray origin (0,0,-48)
LDI r14, 0x3000
LDI r15, 0
STORE r14, r15
ADD r14, r7
STORE r14, r15
ADD r14, r7
LDI r15, 48
NEG r15
STORE r14, r15
; Ray dir (0,0,96)
ADD r14, r7
LDI r15, 0
STORE r14, r15
ADD r14, r7
STORE r14, r15
ADD r14, r7
LDI r15, 96
STORE r14, r15
; Load sphere cx,cy,cz,r_sq
LDI r14, 0x2000
LOAD r15, r14
MOV r1, r14
ADD r1, r7
LOAD r16, r1
ADD r1, r7
LOAD r17, r1
ADD r1, r7
LOAD r18, r1
; L = O - C
LDI r1, 0x3000
LOAD r2, r1
SUB r2, r15
LDI r1, 0x3001
LOAD r3, r1
SUB r3, r16
LDI r1, 0x3002
LOAD r4, r1
SUB r4, r17
; Load dir
LDI r1, 0x3003
LOAD r5, r1
LDI r1, 0x3004
LOAD r6, r1
LDI r1, 0x3005
LOAD r19, r1
; a = dx^2 + dy^2 + dz^2
MOV r20, r5
MUL r20, r5
MOV r21, r6
MUL r21, r6
ADD r20, r21
MOV r21, r19
MUL r21, r19
ADD r20, r21
LDI r1, 0x4000
STORE r1, r20
; half_b = dx*Lx + dy*Ly + dz*Lz
MOV r21, r5
MUL r21, r2
MOV r22, r6
MUL r22, r3
ADD r21, r22
MOV r22, r19
MUL r22, r4
ADD r21, r22
LDI r1, 0x4001
STORE r1, r21
; half_b^2
MOV r23, r21
MUL r23, r21
LDI r1, 0x4002
STORE r1, r23
; c = L*L - r_sq
MOV r22, r2
MUL r22, r2
MOV r23, r3
MUL r23, r3
ADD r22, r23
MOV r23, r4
MUL r23, r4
ADD r22, r23
SUB r22, r18
LDI r1, 0x4003
STORE r1, r22
; a*c
MOV r23, r20
MUL r23, r22
LDI r1, 0x4004
STORE r1, r23
; disc = half_b^2 - a*c
LDI r1, 0x4002
LOAD r21, r1
LDI r1, 0x4004
LOAD r23, r1
SUB r21, r23
LDI r1, 0x4005
STORE r1, r21
; CMP disc with 0
LDI r1, 0
CMP r21, r1
HALT
