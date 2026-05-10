; DESCRIPTION: Creates a black rectangular region at (332, 128) spanning 110 by 52 pixels.
; PLAN: r0=332(x), r1=128(y), r2=110(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 128
LDI r2, 110
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
