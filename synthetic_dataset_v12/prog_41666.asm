; DESCRIPTION: Renders a magenta box of size 69x60 starting at (216, 121).
; PLAN: r0=216(x), r1=121(y), r2=69(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 121
LDI r2, 69
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
