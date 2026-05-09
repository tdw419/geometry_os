; DESCRIPTION: Renders a magenta box of size 85x69 starting at (33, 163).
; PLAN: r0=33(x), r1=163(y), r2=85(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 163
LDI r2, 85
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
