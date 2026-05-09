; DESCRIPTION: Creates a white rectangular region at (1, 172) spanning 11 by 78 pixels.
; PLAN: r0=1(x), r1=172(y), r2=11(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 172
LDI r2, 11
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
