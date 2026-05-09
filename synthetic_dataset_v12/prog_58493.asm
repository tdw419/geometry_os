; DESCRIPTION: Renders a green box of size 38x62 starting at (390, 88).
; PLAN: r0=390(x), r1=88(y), r2=38(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 88
LDI r2, 38
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
