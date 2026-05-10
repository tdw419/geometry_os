; DESCRIPTION: Renders a magenta rectangular region spanning 65 by 119 at (110, 153).
; PLAN: r0=110(x), r1=153(y), r2=65(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 153
LDI r2, 65
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
