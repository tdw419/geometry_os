; DESCRIPTION: Creates a white rectangular region at (20, 23) spanning 79 by 97 pixels.
; PLAN: r0=20(x), r1=23(y), r2=79(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 23
LDI r2, 79
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
