; DESCRIPTION: Creates a white rectangular region at (447, 41) spanning 53 by 39 pixels.
; PLAN: r0=447(x), r1=41(y), r2=53(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 41
LDI r2, 53
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
