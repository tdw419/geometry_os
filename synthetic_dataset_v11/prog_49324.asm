; DESCRIPTION: Renders a magenta box of size 31x114 starting at (91, 31).
; PLAN: r0=91(x), r1=31(y), r2=31(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 31
LDI r2, 31
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
