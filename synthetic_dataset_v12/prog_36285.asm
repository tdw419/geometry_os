; DESCRIPTION: Creates a black rectangular region at (335, 98) spanning 43 by 84 pixels.
; PLAN: r0=335(x), r1=98(y), r2=43(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 98
LDI r2, 43
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
