; DESCRIPTION: Renders a blue box of size 78x88 starting at (396, 52).
; PLAN: r0=396(x), r1=52(y), r2=78(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 52
LDI r2, 78
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
