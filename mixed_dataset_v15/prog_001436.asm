; DESCRIPTION: Creates a white rectangular region at (348, 75) spanning 19 by 18 pixels.
; PLAN: r0=348(x), r1=75(y), r2=19(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 75
LDI r2, 19
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
