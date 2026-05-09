; DESCRIPTION: Creates a white rectangular region at (421, 143) spanning 78 by 38 pixels.
; PLAN: r0=421(x), r1=143(y), r2=78(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 143
LDI r2, 78
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
