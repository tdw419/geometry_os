; DESCRIPTION: Creates a black rectangular region at (49, 11) spanning 44 by 46 pixels.
; PLAN: r0=49(x), r1=11(y), r2=44(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 11
LDI r2, 44
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
