; DESCRIPTION: Creates a black rectangular region at (41, 13) spanning 115 by 108 pixels.
; PLAN: r0=41(x), r1=13(y), r2=115(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 13
LDI r2, 115
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
