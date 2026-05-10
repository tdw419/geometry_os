; DESCRIPTION: Creates a black rectangular region at (115, 78) spanning 115 by 119 pixels.
; PLAN: r0=115(x), r1=78(y), r2=115(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 78
LDI r2, 115
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
