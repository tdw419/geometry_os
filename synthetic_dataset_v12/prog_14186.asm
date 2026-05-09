; DESCRIPTION: Renders a yellow box of size 101x106 starting at (188, 30).
; PLAN: r0=188(x), r1=30(y), r2=101(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 30
LDI r2, 101
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
