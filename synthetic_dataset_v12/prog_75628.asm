; DESCRIPTION: Renders a purple box of size 64x79 starting at (332, 22).
; PLAN: r0=332(x), r1=22(y), r2=64(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 22
LDI r2, 64
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
