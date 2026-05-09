; DESCRIPTION: Creates a black rectangular region at (149, 114) spanning 62 by 89 pixels.
; PLAN: r0=149(x), r1=114(y), r2=62(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 114
LDI r2, 62
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
