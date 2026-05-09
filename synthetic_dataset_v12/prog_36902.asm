; DESCRIPTION: Creates a black rectangular region at (318, 22) spanning 66 by 24 pixels.
; PLAN: r0=318(x), r1=22(y), r2=66(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 22
LDI r2, 66
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
