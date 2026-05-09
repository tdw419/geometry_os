; DESCRIPTION: Creates a green rectangular region at (135, 104) spanning 13 by 13 pixels.
; PLAN: r0=135(x), r1=104(y), r2=13(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 104
LDI r2, 13
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
