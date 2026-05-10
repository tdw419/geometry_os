; DESCRIPTION: Creates a black rectangular region at (122, 64) spanning 41 by 120 pixels.
; PLAN: r0=122(x), r1=64(y), r2=41(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 64
LDI r2, 41
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
