; DESCRIPTION: Renders a yellow box of size 106x43 starting at (137, 93).
; PLAN: r0=137(x), r1=93(y), r2=106(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 93
LDI r2, 106
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
