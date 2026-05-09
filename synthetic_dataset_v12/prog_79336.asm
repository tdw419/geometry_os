; DESCRIPTION: Creates a white rectangular region at (353, 84) spanning 96 by 18 pixels.
; PLAN: r0=353(x), r1=84(y), r2=96(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 84
LDI r2, 96
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
