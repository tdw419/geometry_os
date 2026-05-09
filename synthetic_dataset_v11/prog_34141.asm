; DESCRIPTION: Creates a white rectangular region at (43, 70) spanning 84 by 72 pixels.
; PLAN: r0=43(x), r1=70(y), r2=84(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 70
LDI r2, 84
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
