; DESCRIPTION: Creates a white rectangular region at (24, 70) spanning 23 by 53 pixels.
; PLAN: r0=24(x), r1=70(y), r2=23(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 70
LDI r2, 23
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
