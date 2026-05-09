; DESCRIPTION: Creates a white rectangular region at (367, 70) spanning 22 by 17 pixels.
; PLAN: r0=367(x), r1=70(y), r2=22(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 70
LDI r2, 22
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
