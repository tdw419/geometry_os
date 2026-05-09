; DESCRIPTION: Creates a white rectangular region at (105, 105) spanning 76 by 116 pixels.
; PLAN: r0=105(x), r1=105(y), r2=76(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 105
LDI r2, 76
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
