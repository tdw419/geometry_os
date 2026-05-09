; DESCRIPTION: Renders a magenta box of size 74x119 starting at (163, 26).
; PLAN: r0=163(x), r1=26(y), r2=74(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 26
LDI r2, 74
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
