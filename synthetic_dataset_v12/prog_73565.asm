; DESCRIPTION: Creates a purple rectangular region at (200, 118) spanning 104 by 73 pixels.
; PLAN: r0=200(x), r1=118(y), r2=104(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 118
LDI r2, 104
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
