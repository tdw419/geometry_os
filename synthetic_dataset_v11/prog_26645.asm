; DESCRIPTION: Creates a black rectangular region at (9, 49) spanning 43 by 102 pixels.
; PLAN: r0=9(x), r1=49(y), r2=43(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 49
LDI r2, 43
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
