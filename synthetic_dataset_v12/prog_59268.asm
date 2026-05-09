; DESCRIPTION: Creates a black rectangular region at (136, 85) spanning 41 by 116 pixels.
; PLAN: r0=136(x), r1=85(y), r2=41(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 85
LDI r2, 41
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
