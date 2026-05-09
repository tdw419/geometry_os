; DESCRIPTION: Creates a black rectangular region at (137, 198) spanning 85 by 11 pixels.
; PLAN: r0=137(x), r1=198(y), r2=85(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 198
LDI r2, 85
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
