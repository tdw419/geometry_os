; DESCRIPTION: Renders a magenta box of size 69x106 starting at (78, 10).
; PLAN: r0=78(x), r1=10(y), r2=69(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 10
LDI r2, 69
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
