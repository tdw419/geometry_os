; DESCRIPTION: Creates a red rectangular region at (348, 128) spanning 17 by 38 pixels.
; PLAN: r0=348(x), r1=128(y), r2=17(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 128
LDI r2, 17
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
