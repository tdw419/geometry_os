; DESCRIPTION: Renders a yellow box of size 20x101 starting at (156, 43).
; PLAN: r0=156(x), r1=43(y), r2=20(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 43
LDI r2, 20
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
