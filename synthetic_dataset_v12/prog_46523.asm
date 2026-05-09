; DESCRIPTION: Creates a white rectangular region at (397, 17) spanning 114 by 112 pixels.
; PLAN: r0=397(x), r1=17(y), r2=114(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 17
LDI r2, 114
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
