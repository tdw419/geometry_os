; DESCRIPTION: Creates a purple rectangular region at (181, 56) spanning 53 by 104 pixels.
; PLAN: r0=181(x), r1=56(y), r2=53(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 56
LDI r2, 53
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
