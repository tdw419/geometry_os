; DESCRIPTION: Renders a green box of size 23x106 starting at (430, 101).
; PLAN: r0=430(x), r1=101(y), r2=23(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 101
LDI r2, 23
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
