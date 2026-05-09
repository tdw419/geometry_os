; DESCRIPTION: Renders a purple box of size 64x11 starting at (432, 165).
; PLAN: r0=432(x), r1=165(y), r2=64(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 165
LDI r2, 64
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
