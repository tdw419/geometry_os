; DESCRIPTION: Creates a white rectangular region at (264, 170) spanning 14 by 17 pixels.
; PLAN: r0=264(x), r1=170(y), r2=14(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 170
LDI r2, 14
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
