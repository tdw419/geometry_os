; DESCRIPTION: Creates a black rectangular region at (299, 101) spanning 41 by 70 pixels.
; PLAN: r0=299(x), r1=101(y), r2=41(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 101
LDI r2, 41
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
