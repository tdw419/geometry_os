; DESCRIPTION: Renders a blue box of size 77x101 starting at (396, 65).
; PLAN: r0=396(x), r1=65(y), r2=77(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 65
LDI r2, 77
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
