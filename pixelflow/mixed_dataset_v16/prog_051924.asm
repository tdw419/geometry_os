; DESCRIPTION: Creates a black rectangular region at (110, 123) spanning 118 by 78 pixels.
; PLAN: r0=110(x), r1=123(y), r2=118(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 123
LDI r2, 118
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
