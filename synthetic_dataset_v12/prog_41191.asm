; DESCRIPTION: Creates a magenta rectangular region at (89, 110) spanning 84 by 95 pixels.
; PLAN: r0=89(x), r1=110(y), r2=84(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 110
LDI r2, 84
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
