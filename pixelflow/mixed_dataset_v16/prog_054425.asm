; DESCRIPTION: Creates a orange rectangular region at (348, 26) spanning 16 by 111 pixels.
; PLAN: r0=348(x), r1=26(y), r2=16(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 26
LDI r2, 16
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
