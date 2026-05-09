; DESCRIPTION: Creates a yellow rectangular region at (351, 104) spanning 73 by 48 pixels.
; PLAN: r0=351(x), r1=104(y), r2=73(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 104
LDI r2, 73
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
