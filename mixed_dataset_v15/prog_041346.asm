; DESCRIPTION: Renders a purple box of size 11x51 starting at (431, 138).
; PLAN: r0=431(x), r1=138(y), r2=11(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 138
LDI r2, 11
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
