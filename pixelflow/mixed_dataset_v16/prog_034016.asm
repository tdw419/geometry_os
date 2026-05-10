; DESCRIPTION: Creates a black rectangular region at (110, 97) spanning 30 by 118 pixels.
; PLAN: r0=110(x), r1=97(y), r2=30(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 97
LDI r2, 30
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
