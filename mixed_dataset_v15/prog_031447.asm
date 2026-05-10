; DESCRIPTION: Creates a black rectangular region at (378, 76) spanning 56 by 102 pixels.
; PLAN: r0=378(x), r1=76(y), r2=56(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 76
LDI r2, 56
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
