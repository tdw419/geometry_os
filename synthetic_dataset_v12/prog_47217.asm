; DESCRIPTION: Renders a black box of size 11x118 starting at (266, 85).
; PLAN: r0=266(x), r1=85(y), r2=11(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 85
LDI r2, 11
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
