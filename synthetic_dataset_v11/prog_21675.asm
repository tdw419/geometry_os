; DESCRIPTION: Renders a yellow box of size 10x75 starting at (114, 158).
; PLAN: r0=114(x), r1=158(y), r2=10(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 158
LDI r2, 10
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
