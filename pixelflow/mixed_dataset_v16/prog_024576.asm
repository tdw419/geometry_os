; DESCRIPTION: Creates a black rectangular region at (122, 155) spanning 38 by 93 pixels.
; PLAN: r0=122(x), r1=155(y), r2=38(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 155
LDI r2, 38
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
