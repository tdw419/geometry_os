; DESCRIPTION: Creates a white rectangular region at (78, 83) spanning 88 by 96 pixels.
; PLAN: r0=78(x), r1=83(y), r2=88(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 83
LDI r2, 88
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
