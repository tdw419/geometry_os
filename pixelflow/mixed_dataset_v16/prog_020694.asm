; DESCRIPTION: Creates a black rectangular region at (15, 5) spanning 119 by 75 pixels.
; PLAN: r0=15(x), r1=5(y), r2=119(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 5
LDI r2, 119
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
