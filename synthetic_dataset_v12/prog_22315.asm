; DESCRIPTION: Creates a black rectangular region at (149, 114) spanning 76 by 76 pixels.
; PLAN: r0=149(x), r1=114(y), r2=76(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 114
LDI r2, 76
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
