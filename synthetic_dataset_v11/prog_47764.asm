; DESCRIPTION: Creates a green rectangular region at (7, 21) spanning 110 by 56 pixels.
; PLAN: r0=7(x), r1=21(y), r2=110(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 21
LDI r2, 110
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
