; DESCRIPTION: Renders a purple box of size 115x51 starting at (77, 107).
; PLAN: r0=77(x), r1=107(y), r2=115(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 107
LDI r2, 115
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
