; DESCRIPTION: Creates a black rectangular region at (122, 195) spanning 75 by 36 pixels.
; PLAN: r0=122(x), r1=195(y), r2=75(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 195
LDI r2, 75
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
