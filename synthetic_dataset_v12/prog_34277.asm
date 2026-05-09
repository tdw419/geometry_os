; DESCRIPTION: Renders a purple box of size 64x69 starting at (324, 51).
; PLAN: r0=324(x), r1=51(y), r2=64(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 51
LDI r2, 64
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
