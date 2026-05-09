; DESCRIPTION: Creates a white rectangular region at (432, 22) spanning 53 by 106 pixels.
; PLAN: r0=432(x), r1=22(y), r2=53(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 22
LDI r2, 53
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
