; DESCRIPTION: Creates a blue rectangular region at (348, 13) spanning 80 by 83 pixels.
; PLAN: r0=348(x), r1=13(y), r2=80(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 13
LDI r2, 80
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
