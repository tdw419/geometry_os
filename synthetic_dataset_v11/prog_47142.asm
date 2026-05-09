; DESCRIPTION: Renders a magenta box of size 100x63 starting at (44, 105).
; PLAN: r0=44(x), r1=105(y), r2=100(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 105
LDI r2, 100
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
