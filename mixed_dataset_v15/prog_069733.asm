; DESCRIPTION: Creates a purple rectangular region at (15, 104) spanning 13 by 20 pixels.
; PLAN: r0=15(x), r1=104(y), r2=13(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 104
LDI r2, 13
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
