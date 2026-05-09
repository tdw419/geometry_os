; DESCRIPTION: Creates a white rectangular region at (203, 55) spanning 43 by 118 pixels.
; PLAN: r0=203(x), r1=55(y), r2=43(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 55
LDI r2, 43
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
