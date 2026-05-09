; DESCRIPTION: Creates a white rectangular region at (282, 19) spanning 112 by 116 pixels.
; PLAN: r0=282(x), r1=19(y), r2=112(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 19
LDI r2, 112
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
