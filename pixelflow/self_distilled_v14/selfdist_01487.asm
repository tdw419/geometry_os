; DESCRIPTION: Renders a magenta rectangular region spanning 79 by 26 at (269, 159).
; PLAN: r0=269(x), r1=159(y), r2=79(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 159
LDI r2, 79
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
