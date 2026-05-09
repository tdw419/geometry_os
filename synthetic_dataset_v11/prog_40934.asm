; DESCRIPTION: Creates a purple rectangular region at (5, 96) spanning 84 by 104 pixels.
; PLAN: r0=5(x), r1=96(y), r2=84(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 96
LDI r2, 84
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
