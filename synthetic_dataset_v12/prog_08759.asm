; DESCRIPTION: Creates a black rectangular region at (41, 43) spanning 112 by 10 pixels.
; PLAN: r0=41(x), r1=43(y), r2=112(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 43
LDI r2, 112
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
