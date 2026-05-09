; DESCRIPTION: Creates a purple rectangular region at (22, 104) spanning 94 by 103 pixels.
; PLAN: r0=22(x), r1=104(y), r2=94(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 104
LDI r2, 94
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
