; DESCRIPTION: Creates a purple rectangular region at (101, 97) spanning 104 by 119 pixels.
; PLAN: r0=101(x), r1=97(y), r2=104(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 97
LDI r2, 104
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
