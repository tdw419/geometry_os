; DESCRIPTION: Fills the screen with a vertical red gradient from dark to bright.
; PLAN: r0=0xFF0000(base color), r1=0(y), r2=0(x), r3=512(width), r4=256(height). r10 is comparison result.
LDI r0, 0xFF0000
LDI r1, 0
y_loop:
LDI r2, 0
x_loop:
PSET r2, r1, r0
LDI r5, 1
ADD r2, r5
LDI r6, 512
CMP r2, r6
BLT r10, x_loop
LDI r5, 1
ADD r1, r5
LDI r6, 256
CMP r1, r6
BLT r10, y_loop
HALT
