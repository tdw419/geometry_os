; DESCRIPTION: Creates a black rectangular region at (194, 53) spanning 21 by 65 pixels.
; PLAN: r0=194(x), r1=53(y), r2=21(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 53
LDI r2, 21
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
