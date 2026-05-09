; DESCRIPTION: Creates a black rectangular region at (194, 123) spanning 26 by 109 pixels.
; PLAN: r0=194(x), r1=123(y), r2=26(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 123
LDI r2, 26
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
