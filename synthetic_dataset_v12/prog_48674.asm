; DESCRIPTION: Creates a white rectangular region at (348, 134) spanning 72 by 71 pixels.
; PLAN: r0=348(x), r1=134(y), r2=72(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 134
LDI r2, 72
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
