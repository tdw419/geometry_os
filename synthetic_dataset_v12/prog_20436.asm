; DESCRIPTION: Creates a green rectangular region at (229, 29) spanning 78 by 84 pixels.
; PLAN: r0=229(x), r1=29(y), r2=78(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 29
LDI r2, 78
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
