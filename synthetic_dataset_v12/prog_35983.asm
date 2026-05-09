; DESCRIPTION: Creates a white rectangular region at (125, 25) spanning 41 by 101 pixels.
; PLAN: r0=125(x), r1=25(y), r2=41(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 25
LDI r2, 41
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
