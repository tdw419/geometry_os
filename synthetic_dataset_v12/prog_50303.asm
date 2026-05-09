; DESCRIPTION: Creates a magenta rectangular region at (130, 110) spanning 106 by 70 pixels.
; PLAN: r0=130(x), r1=110(y), r2=106(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 110
LDI r2, 106
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
