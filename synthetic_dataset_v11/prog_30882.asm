; DESCRIPTION: Creates a white rectangular region at (110, 139) spanning 17 by 110 pixels.
; PLAN: r0=110(x), r1=139(y), r2=17(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 139
LDI r2, 17
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
