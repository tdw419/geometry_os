; DESCRIPTION: Creates a yellow rectangular region at (332, 97) spanning 59 by 75 pixels.
; PLAN: r0=332(x), r1=97(y), r2=59(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 97
LDI r2, 59
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
