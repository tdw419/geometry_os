; DESCRIPTION: Renders a yellow box of size 80x101 starting at (86, 49).
; PLAN: r0=86(x), r1=49(y), r2=80(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 49
LDI r2, 80
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
