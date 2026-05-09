; DESCRIPTION: Creates a black rectangular region at (230, 34) spanning 35 by 110 pixels.
; PLAN: r0=230(x), r1=34(y), r2=35(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 34
LDI r2, 35
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
