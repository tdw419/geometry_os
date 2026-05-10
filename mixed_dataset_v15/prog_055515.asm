; DESCRIPTION: Creates a white rectangular region at (312, 26) spanning 53 by 77 pixels.
; PLAN: r0=312(x), r1=26(y), r2=53(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 26
LDI r2, 53
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
