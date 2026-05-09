; DESCRIPTION: Renders a magenta box of size 35x116 starting at (451, 66).
; PLAN: r0=451(x), r1=66(y), r2=35(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 66
LDI r2, 35
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
