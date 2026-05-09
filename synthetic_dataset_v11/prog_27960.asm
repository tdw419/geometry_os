; DESCRIPTION: Creates a black rectangular region at (157, 119) spanning 77 by 88 pixels.
; PLAN: r0=157(x), r1=119(y), r2=77(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 119
LDI r2, 77
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
