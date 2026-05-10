; DESCRIPTION: Creates a black rectangular region at (76, 139) spanning 97 by 86 pixels.
; PLAN: r0=76(x), r1=139(y), r2=97(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 139
LDI r2, 97
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
