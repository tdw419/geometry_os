; DESCRIPTION: Creates a white rectangular region at (122, 112) spanning 22 by 78 pixels.
; PLAN: r0=122(x), r1=112(y), r2=22(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 112
LDI r2, 22
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
