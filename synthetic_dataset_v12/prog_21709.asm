; DESCRIPTION: Creates a magenta rectangular region at (130, 110) spanning 119 by 80 pixels.
; PLAN: r0=130(x), r1=110(y), r2=119(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 110
LDI r2, 119
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
