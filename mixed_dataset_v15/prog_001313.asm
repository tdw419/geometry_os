; DESCRIPTION: Creates a white rectangular region at (214, 14) spanning 41 by 97 pixels.
; PLAN: r0=214(x), r1=14(y), r2=41(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 14
LDI r2, 41
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
