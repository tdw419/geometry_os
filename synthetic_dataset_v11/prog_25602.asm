; DESCRIPTION: Renders a magenta box of size 69x37 starting at (25, 22).
; PLAN: r0=25(x), r1=22(y), r2=69(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 22
LDI r2, 69
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
