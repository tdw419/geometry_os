; DESCRIPTION: Creates a white rectangular region at (107, 165) spanning 60 by 41 pixels.
; PLAN: r0=107(x), r1=165(y), r2=60(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 165
LDI r2, 60
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
