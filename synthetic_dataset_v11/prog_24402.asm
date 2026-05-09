; DESCRIPTION: Renders a yellow box of size 18x106 starting at (93, 6).
; PLAN: r0=93(x), r1=6(y), r2=18(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 6
LDI r2, 18
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
