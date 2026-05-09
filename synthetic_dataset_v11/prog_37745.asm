; DESCRIPTION: Creates a green rectangular region at (138, 110) spanning 30 by 104 pixels.
; PLAN: r0=138(x), r1=110(y), r2=30(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 110
LDI r2, 30
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
