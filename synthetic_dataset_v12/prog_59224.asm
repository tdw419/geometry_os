; DESCRIPTION: Creates a white rectangular region at (355, 110) spanning 34 by 65 pixels.
; PLAN: r0=355(x), r1=110(y), r2=34(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 110
LDI r2, 34
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
