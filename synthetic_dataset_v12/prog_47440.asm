; DESCRIPTION: Creates a black rectangular region at (28, 123) spanning 73 by 119 pixels.
; PLAN: r0=28(x), r1=123(y), r2=73(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 123
LDI r2, 73
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
