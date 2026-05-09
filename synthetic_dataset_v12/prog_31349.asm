; DESCRIPTION: Creates a black rectangular region at (363, 18) spanning 55 by 62 pixels.
; PLAN: r0=363(x), r1=18(y), r2=55(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 18
LDI r2, 55
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
