; DESCRIPTION: Renders a yellow box of size 69x101 starting at (85, 114).
; PLAN: r0=85(x), r1=114(y), r2=69(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 114
LDI r2, 69
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
