; DESCRIPTION: Creates a white rectangular region at (43, 95) spanning 78 by 116 pixels.
; PLAN: r0=43(x), r1=95(y), r2=78(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 95
LDI r2, 78
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
