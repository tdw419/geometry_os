; DESCRIPTION: Creates a black rectangular region at (118, 121) spanning 62 by 110 pixels.
; PLAN: r0=118(x), r1=121(y), r2=62(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 121
LDI r2, 62
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
