; DESCRIPTION: Creates a green rectangular region at (140, 110) spanning 69 by 30 pixels.
; PLAN: r0=140(x), r1=110(y), r2=69(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 110
LDI r2, 69
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
