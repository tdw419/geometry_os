; DESCRIPTION: Creates a white rectangular region at (57, 55) spanning 114 by 97 pixels.
; PLAN: r0=57(x), r1=55(y), r2=114(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 55
LDI r2, 114
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
