; DESCRIPTION: Creates a white rectangular region at (426, 178) spanning 29 by 41 pixels.
; PLAN: r0=426(x), r1=178(y), r2=29(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 178
LDI r2, 29
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
