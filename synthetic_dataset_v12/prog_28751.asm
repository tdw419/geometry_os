; DESCRIPTION: Creates a white rectangular region at (66, 170) spanning 91 by 20 pixels.
; PLAN: r0=66(x), r1=170(y), r2=91(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 170
LDI r2, 91
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
