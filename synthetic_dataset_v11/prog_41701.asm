; DESCRIPTION: Creates a green rectangular region at (140, 104) spanning 94 by 35 pixels.
; PLAN: r0=140(x), r1=104(y), r2=94(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 104
LDI r2, 94
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
