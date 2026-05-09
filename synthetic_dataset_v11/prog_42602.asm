; DESCRIPTION: Creates a white rectangular region at (17, 110) spanning 80 by 76 pixels.
; PLAN: r0=17(x), r1=110(y), r2=80(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 110
LDI r2, 80
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
