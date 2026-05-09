; DESCRIPTION: Renders a purple box of size 105x51 starting at (66, 112).
; PLAN: r0=66(x), r1=112(y), r2=105(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 112
LDI r2, 105
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
