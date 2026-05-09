; DESCRIPTION: Creates a magenta rectangular region at (325, 12) spanning 119 by 114 pixels.
; PLAN: r0=325(x), r1=12(y), r2=119(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 12
LDI r2, 119
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
