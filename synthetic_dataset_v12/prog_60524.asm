; DESCRIPTION: Creates a yellow rectangular region at (304, 170) spanning 25 by 79 pixels.
; PLAN: r0=304(x), r1=170(y), r2=25(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 170
LDI r2, 25
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
