; DESCRIPTION: Creates a black rectangular region at (41, 26) spanning 48 by 105 pixels.
; PLAN: r0=41(x), r1=26(y), r2=48(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 26
LDI r2, 48
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
