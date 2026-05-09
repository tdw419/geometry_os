; DESCRIPTION: Creates a black rectangular region at (490, 157) spanning 22 by 35 pixels.
; PLAN: r0=490(x), r1=157(y), r2=22(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 157
LDI r2, 22
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
