; DESCRIPTION: Creates a white rectangular region at (8, 78) spanning 52 by 35 pixels.
; PLAN: r0=8(x), r1=78(y), r2=52(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 78
LDI r2, 52
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
