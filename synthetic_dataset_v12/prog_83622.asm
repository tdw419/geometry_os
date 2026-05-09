; DESCRIPTION: Creates a black rectangular region at (348, 133) spanning 47 by 80 pixels.
; PLAN: r0=348(x), r1=133(y), r2=47(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 133
LDI r2, 47
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
