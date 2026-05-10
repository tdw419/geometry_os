; DESCRIPTION: Renders a blue rectangular region spanning 44 by 51 at (252, 79).
; PLAN: r0=252(x), r1=79(y), r2=44(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 79
LDI r2, 44
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
