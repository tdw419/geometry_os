; DESCRIPTION: Renders a magenta box of size 83x119 starting at (2, 106).
; PLAN: r0=2(x), r1=106(y), r2=83(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 106
LDI r2, 83
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
