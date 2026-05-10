; DESCRIPTION: Creates a yellow rectangular region at (27, 104) spanning 119 by 97 pixels.
; PLAN: r0=27(x), r1=104(y), r2=119(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 104
LDI r2, 119
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
