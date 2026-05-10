; DESCRIPTION: Renders a yellow box of size 49x118 starting at (44, 25).
; PLAN: r0=44(x), r1=25(y), r2=49(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 25
LDI r2, 49
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
