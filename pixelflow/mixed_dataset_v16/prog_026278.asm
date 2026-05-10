; DESCRIPTION: Fills the screen with a vertical purple gradient from dark to bright.
; PLAN: r0=CMP flag (readonly), r1=0(y), r2=0(x), r3=512(y), r4=0xAA00FF(color). CMP stores result in r0.
LDI r7, 0xAA00FF
LDI r1, 0
LDI r2, 0
JNZ r1, loopp
LDI r2, 0
JNZ r1, loop
PSET r2, r1, r7
LDI r5, 1
ADD r2, r5
LDI r6, 512
CMP r2, r6
BLT r0, x_loop
LDI r5, 1
ADD r1, r5
LDI r6, 256
CMP r1, r6
BLT r0, y_loop
HALT
