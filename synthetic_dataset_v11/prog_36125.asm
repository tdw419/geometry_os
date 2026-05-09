; DESCRIPTION: Fills the screen with a vertical green gradient from dark to bright.
; PLAN: r0=0x00FF00(base color), r1=0(y start), r2=0(x), r3=256(width), r4=256(height), r5=1(inc), r6=256(limit). Loop: PSET r2, r1, r0 across x, then INC r1.
LDI r0, 0x00FF00
LDI r1, 0
y_loop:
LDI r2, 0
x_loop:
PSET r2, r1, r0
LDI r5, 1
ADD r2, r5
LDI r6, 256
CMP r2, r6
BLT r0, x_loop
LDI r5, 1
ADD r1, r5
LDI r6, 256
CMP r1, r6
BLT r0, y_loop
HALT
