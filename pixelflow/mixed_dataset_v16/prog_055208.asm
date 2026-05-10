; DESCRIPTION: Creates a black rectangular region at (316, 155) spanning 108 by 29 pixels.
; PLAN: r0=316(x), r1=155(y), r2=108(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 155
LDI r2, 108
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
