; DESCRIPTION: Creates a white rectangular region at (133, 41) spanning 71 by 101 pixels.
; PLAN: r0=133(x), r1=41(y), r2=71(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 41
LDI r2, 71
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
