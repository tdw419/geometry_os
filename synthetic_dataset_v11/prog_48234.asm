; DESCRIPTION: Creates a black rectangular region at (97, 73) spanning 90 by 110 pixels.
; PLAN: r0=97(x), r1=73(y), r2=90(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 73
LDI r2, 90
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
