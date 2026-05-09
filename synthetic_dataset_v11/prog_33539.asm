; DESCRIPTION: Creates a white rectangular region at (134, 156) spanning 105 by 35 pixels.
; PLAN: r0=134(x), r1=156(y), r2=105(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 156
LDI r2, 105
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
