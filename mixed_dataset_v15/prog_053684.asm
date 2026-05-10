; DESCRIPTION: Renders a magenta box of size 114x80 starting at (33, 66).
; PLAN: r0=33(x), r1=66(y), r2=114(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 66
LDI r2, 114
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
