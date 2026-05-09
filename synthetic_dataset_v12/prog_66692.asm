; DESCRIPTION: Creates a purple rectangular region at (157, 4) spanning 88 by 104 pixels.
; PLAN: r0=157(x), r1=4(y), r2=88(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 4
LDI r2, 88
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
