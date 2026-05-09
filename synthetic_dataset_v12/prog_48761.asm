; DESCRIPTION: Creates a white rectangular region at (136, 15) spanning 105 by 110 pixels.
; PLAN: r0=136(x), r1=15(y), r2=105(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 15
LDI r2, 105
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
