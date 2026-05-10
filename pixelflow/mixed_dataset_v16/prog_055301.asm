; DESCRIPTION: Renders a magenta rectangular region spanning 79 by 97 at (24, 25).
; PLAN: r0=24(x), r1=25(y), r2=79(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 25
LDI r2, 79
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
