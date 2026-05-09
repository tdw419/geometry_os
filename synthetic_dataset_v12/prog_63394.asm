; DESCRIPTION: Renders a green box of size 77x26 starting at (158, 53).
; PLAN: r0=158(x), r1=53(y), r2=77(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 53
LDI r2, 77
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
