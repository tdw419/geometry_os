; DESCRIPTION: Renders a black box of size 54x106 starting at (178, 97).
; PLAN: r0=178(x), r1=97(y), r2=54(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 97
LDI r2, 54
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
