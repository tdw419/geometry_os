; DESCRIPTION: Creates a green rectangular region at (258, 136) spanning 69 by 110 pixels.
; PLAN: r0=258(x), r1=136(y), r2=69(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 136
LDI r2, 69
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
