; DESCRIPTION: Creates a white rectangular region at (219, 18) spanning 17 by 116 pixels.
; PLAN: r0=219(x), r1=18(y), r2=17(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 18
LDI r2, 17
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
