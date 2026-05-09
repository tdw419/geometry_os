; DESCRIPTION: Creates a white rectangular region at (100, 49) spanning 35 by 53 pixels.
; PLAN: r0=100(x), r1=49(y), r2=35(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 49
LDI r2, 35
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
