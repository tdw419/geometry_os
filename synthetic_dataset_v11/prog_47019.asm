; DESCRIPTION: Creates a green rectangular region at (60, 110) spanning 20 by 11 pixels.
; PLAN: r0=60(x), r1=110(y), r2=20(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 110
LDI r2, 20
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
