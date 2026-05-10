; DESCRIPTION: Renders a magenta box of size 26x119 starting at (319, 65).
; PLAN: r0=319(x), r1=65(y), r2=26(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 65
LDI r2, 26
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
