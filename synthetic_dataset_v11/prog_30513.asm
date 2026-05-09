; DESCRIPTION: Renders a magenta box of size 11x79 starting at (194, 110).
; PLAN: r0=194(x), r1=110(y), r2=11(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 110
LDI r2, 11
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
