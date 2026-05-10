; DESCRIPTION: Creates a white rectangular region at (416, 123) spanning 41 by 101 pixels.
; PLAN: r0=416(x), r1=123(y), r2=41(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 123
LDI r2, 41
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
