; DESCRIPTION: Creates a magenta rectangular region at (89, 147) spanning 119 by 35 pixels.
; PLAN: r0=89(x), r1=147(y), r2=119(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 147
LDI r2, 119
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
