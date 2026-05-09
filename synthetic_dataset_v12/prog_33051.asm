; DESCRIPTION: Renders a green box of size 88x62 starting at (96, 158).
; PLAN: r0=96(x), r1=158(y), r2=88(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 158
LDI r2, 88
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
