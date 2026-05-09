; DESCRIPTION: Renders a purple box of size 17x51 starting at (26, 194).
; PLAN: r0=26(x), r1=194(y), r2=17(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 194
LDI r2, 17
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
