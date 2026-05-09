; DESCRIPTION: Renders a magenta box of size 53x118 starting at (138, 137).
; PLAN: r0=138(x), r1=137(y), r2=53(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 137
LDI r2, 53
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
