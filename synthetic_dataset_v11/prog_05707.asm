; DESCRIPTION: Creates a green rectangular region at (35, 126) spanning 110 by 78 pixels.
; PLAN: r0=35(x), r1=126(y), r2=110(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 126
LDI r2, 110
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
