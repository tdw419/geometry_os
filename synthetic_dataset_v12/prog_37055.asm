; DESCRIPTION: Renders a magenta box of size 29x117 starting at (166, 66).
; PLAN: r0=166(x), r1=66(y), r2=29(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 66
LDI r2, 29
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
