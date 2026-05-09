; DESCRIPTION: Creates a yellow rectangular region at (104, 19) spanning 85 by 49 pixels.
; PLAN: r0=104(x), r1=19(y), r2=85(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 19
LDI r2, 85
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
