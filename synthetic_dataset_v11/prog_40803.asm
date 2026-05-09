; DESCRIPTION: Creates a black rectangular region at (143, 140) spanning 84 by 83 pixels.
; PLAN: r0=143(x), r1=140(y), r2=84(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 140
LDI r2, 84
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
