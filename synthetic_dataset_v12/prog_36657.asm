; DESCRIPTION: Creates a purple rectangular region at (348, 6) spanning 10 by 39 pixels.
; PLAN: r0=348(x), r1=6(y), r2=10(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 6
LDI r2, 10
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
