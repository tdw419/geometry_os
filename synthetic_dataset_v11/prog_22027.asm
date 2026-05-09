; DESCRIPTION: Renders a magenta box of size 26x25 starting at (105, 69).
; PLAN: r0=105(x), r1=69(y), r2=26(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 69
LDI r2, 26
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
