; DESCRIPTION: Creates a black rectangular region at (363, 124) spanning 15 by 119 pixels.
; PLAN: r0=363(x), r1=124(y), r2=15(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 124
LDI r2, 15
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
