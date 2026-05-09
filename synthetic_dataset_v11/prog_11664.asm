; DESCRIPTION: Creates a yellow rectangular region at (155, 170) spanning 70 by 44 pixels.
; PLAN: r0=155(x), r1=170(y), r2=70(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 170
LDI r2, 70
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
