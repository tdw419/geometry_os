; DESCRIPTION: Renders a magenta box of size 69x73 starting at (163, 165).
; PLAN: r0=163(x), r1=165(y), r2=69(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 165
LDI r2, 69
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
