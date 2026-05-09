; DESCRIPTION: Creates a black rectangular region at (97, 139) spanning 18 by 37 pixels.
; PLAN: r0=97(x), r1=139(y), r2=18(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 139
LDI r2, 18
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
