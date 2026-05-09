; DESCRIPTION: Creates a white rectangular region at (17, 116) spanning 96 by 31 pixels.
; PLAN: r0=17(x), r1=116(y), r2=96(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 116
LDI r2, 96
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
