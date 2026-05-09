; DESCRIPTION: Renders a purple box of size 15x51 starting at (453, 89).
; PLAN: r0=453(x), r1=89(y), r2=15(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 89
LDI r2, 15
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
