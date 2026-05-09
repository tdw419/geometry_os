; DESCRIPTION: Creates a green rectangular region at (353, 45) spanning 49 by 104 pixels.
; PLAN: r0=353(x), r1=45(y), r2=49(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 45
LDI r2, 49
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
