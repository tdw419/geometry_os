; DESCRIPTION: Creates a purple rectangular region at (308, 85) spanning 105 by 104 pixels.
; PLAN: r0=308(x), r1=85(y), r2=105(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 85
LDI r2, 105
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
