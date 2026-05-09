; DESCRIPTION: Creates a green rectangular region at (110, 35) spanning 50 by 20 pixels.
; PLAN: r0=110(x), r1=35(y), r2=50(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 35
LDI r2, 50
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
