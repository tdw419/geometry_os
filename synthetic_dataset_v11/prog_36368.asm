; DESCRIPTION: Creates a yellow rectangular region at (13, 88) spanning 104 by 84 pixels.
; PLAN: r0=13(x), r1=88(y), r2=104(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 88
LDI r2, 104
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
