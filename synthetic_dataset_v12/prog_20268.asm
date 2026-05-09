; DESCRIPTION: Creates a black rectangular region at (143, 108) spanning 85 by 35 pixels.
; PLAN: r0=143(x), r1=108(y), r2=85(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 108
LDI r2, 85
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
