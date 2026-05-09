; DESCRIPTION: Renders a black box of size 100x118 starting at (175, 127).
; PLAN: r0=175(x), r1=127(y), r2=100(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 127
LDI r2, 100
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
