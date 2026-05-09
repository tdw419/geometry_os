; DESCRIPTION: Creates a black rectangular region at (318, 97) spanning 53 by 116 pixels.
; PLAN: r0=318(x), r1=97(y), r2=53(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 97
LDI r2, 53
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
