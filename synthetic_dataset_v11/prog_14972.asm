; DESCRIPTION: Renders a green box of size 88x93 starting at (86, 58).
; PLAN: r0=86(x), r1=58(y), r2=88(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 58
LDI r2, 88
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
