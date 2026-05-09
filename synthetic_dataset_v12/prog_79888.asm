; DESCRIPTION: Creates a white rectangular region at (53, 9) spanning 78 by 90 pixels.
; PLAN: r0=53(x), r1=9(y), r2=78(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 9
LDI r2, 78
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
