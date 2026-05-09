; DESCRIPTION: Creates a white rectangular region at (88, 98) spanning 115 by 62 pixels.
; PLAN: r0=88(x), r1=98(y), r2=115(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 98
LDI r2, 115
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
