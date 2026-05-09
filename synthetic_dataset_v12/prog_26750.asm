; DESCRIPTION: Creates a black rectangular region at (137, 72) spanning 17 by 62 pixels.
; PLAN: r0=137(x), r1=72(y), r2=17(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 72
LDI r2, 17
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
