; DESCRIPTION: Creates a white rectangular region at (105, 151) spanning 84 by 97 pixels.
; PLAN: r0=105(x), r1=151(y), r2=84(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 151
LDI r2, 84
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
