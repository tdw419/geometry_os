; DESCRIPTION: Renders a green box of size 49x114 starting at (5, 90).
; PLAN: r0=5(x), r1=90(y), r2=49(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 90
LDI r2, 49
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
