; DESCRIPTION: Renders a blue box of size 69x101 starting at (212, 77).
; PLAN: r0=212(x), r1=77(y), r2=69(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 77
LDI r2, 69
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
