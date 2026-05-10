; DESCRIPTION: Creates a black rectangular region at (276, 123) spanning 61 by 35 pixels.
; PLAN: r0=276(x), r1=123(y), r2=61(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 123
LDI r2, 61
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
