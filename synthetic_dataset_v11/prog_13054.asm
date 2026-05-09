; DESCRIPTION: Creates a white rectangular region at (134, 84) spanning 30 by 85 pixels.
; PLAN: r0=134(x), r1=84(y), r2=30(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 84
LDI r2, 30
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
