; DESCRIPTION: Creates a white rectangular region at (367, 155) spanning 22 by 56 pixels.
; PLAN: r0=367(x), r1=155(y), r2=22(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 155
LDI r2, 22
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
