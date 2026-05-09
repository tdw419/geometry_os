; DESCRIPTION: Renders a white box of size 66x57 starting at (348, 156).
; PLAN: r0=348(x), r1=156(y), r2=66(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 156
LDI r2, 66
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
