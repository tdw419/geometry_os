; DESCRIPTION: Creates a black rectangular region at (441, 76) spanning 15 by 107 pixels.
; PLAN: r0=441(x), r1=76(y), r2=15(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 76
LDI r2, 15
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
