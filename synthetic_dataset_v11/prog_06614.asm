; DESCRIPTION: Creates a yellow rectangular region at (144, 84) spanning 26 by 94 pixels.
; PLAN: r0=144(x), r1=84(y), r2=26(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 84
LDI r2, 26
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
