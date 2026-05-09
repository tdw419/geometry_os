; DESCRIPTION: Creates a black rectangular region at (97, 104) spanning 36 by 86 pixels.
; PLAN: r0=97(x), r1=104(y), r2=36(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 104
LDI r2, 36
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
