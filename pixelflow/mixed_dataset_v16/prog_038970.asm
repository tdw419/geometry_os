; DESCRIPTION: Creates a black rectangular region at (62, 37) spanning 17 by 23 pixels.
; PLAN: r0=62(x), r1=37(y), r2=17(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 37
LDI r2, 17
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
