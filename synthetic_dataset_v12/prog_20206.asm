; DESCRIPTION: Creates a purple rectangular region at (308, 99) spanning 90 by 104 pixels.
; PLAN: r0=308(x), r1=99(y), r2=90(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 99
LDI r2, 90
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
