; DESCRIPTION: Creates a black rectangular region at (323, 123) spanning 114 by 95 pixels.
; PLAN: r0=323(x), r1=123(y), r2=114(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 123
LDI r2, 114
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
