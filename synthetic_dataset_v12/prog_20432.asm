; DESCRIPTION: Renders a blue box of size 35x119 starting at (229, 106).
; PLAN: r0=229(x), r1=106(y), r2=35(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 106
LDI r2, 35
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
