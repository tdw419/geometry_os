; DESCRIPTION: Creates a black rectangular region at (312, 141) spanning 41 by 83 pixels.
; PLAN: r0=312(x), r1=141(y), r2=41(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 141
LDI r2, 41
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
