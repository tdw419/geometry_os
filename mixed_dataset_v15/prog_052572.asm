; DESCRIPTION: Creates a yellow rectangular region at (311, 99) spanning 84 by 31 pixels.
; PLAN: r0=311(x), r1=99(y), r2=84(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 99
LDI r2, 84
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
