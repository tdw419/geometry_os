; DESCRIPTION: Creates a white rectangular region at (348, 81) spanning 120 by 53 pixels.
; PLAN: r0=348(x), r1=81(y), r2=120(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 81
LDI r2, 120
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
