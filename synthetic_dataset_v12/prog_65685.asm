; DESCRIPTION: Creates a black rectangular region at (105, 144) spanning 14 by 110 pixels.
; PLAN: r0=105(x), r1=144(y), r2=14(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 144
LDI r2, 14
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
