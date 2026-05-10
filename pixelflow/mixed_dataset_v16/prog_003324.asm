; DESCRIPTION: Renders a purple box of size 17x95 starting at (155, 137).
; PLAN: r0=155(x), r1=137(y), r2=17(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 137
LDI r2, 17
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
