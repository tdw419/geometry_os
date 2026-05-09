; DESCRIPTION: Renders a magenta box of size 115x103 starting at (114, 58).
; PLAN: r0=114(x), r1=58(y), r2=115(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 58
LDI r2, 115
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
