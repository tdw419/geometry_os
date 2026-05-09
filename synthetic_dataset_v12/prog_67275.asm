; DESCRIPTION: Creates a white rectangular region at (166, 204) spanning 41 by 49 pixels.
; PLAN: r0=166(x), r1=204(y), r2=41(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 204
LDI r2, 41
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
