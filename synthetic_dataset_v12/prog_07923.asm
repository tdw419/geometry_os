; DESCRIPTION: Creates a black rectangular region at (478, 39) spanning 20 by 110 pixels.
; PLAN: r0=478(x), r1=39(y), r2=20(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 39
LDI r2, 20
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
