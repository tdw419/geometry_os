; DESCRIPTION: Renders a blue box of size 35x14 starting at (129, 79).
; PLAN: r0=129(x), r1=79(y), r2=35(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 79
LDI r2, 35
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
