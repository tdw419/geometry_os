; DESCRIPTION: Creates a blue rectangular region at (348, 165) spanning 97 by 85 pixels.
; PLAN: r0=348(x), r1=165(y), r2=97(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 165
LDI r2, 97
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
