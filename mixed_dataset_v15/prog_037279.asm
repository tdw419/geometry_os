; DESCRIPTION: Renders a magenta box of size 115x101 starting at (66, 88).
; PLAN: r0=66(x), r1=88(y), r2=115(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 88
LDI r2, 115
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
