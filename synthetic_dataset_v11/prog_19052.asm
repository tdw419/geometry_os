; DESCRIPTION: Creates a green rectangular region at (72, 87) spanning 110 by 38 pixels.
; PLAN: r0=72(x), r1=87(y), r2=110(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 87
LDI r2, 110
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
