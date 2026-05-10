; DESCRIPTION: Creates a green rectangular region at (437, 35) spanning 73 by 110 pixels.
; PLAN: r0=437(x), r1=35(y), r2=73(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 35
LDI r2, 73
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
