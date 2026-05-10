; DESCRIPTION: Creates a green rectangular region at (325, 86) spanning 31 by 104 pixels.
; PLAN: r0=325(x), r1=86(y), r2=31(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 86
LDI r2, 31
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
