; DESCRIPTION: Creates a yellow rectangular region at (56, 15) spanning 46 by 75 pixels.
; PLAN: r0=56(x), r1=15(y), r2=46(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 15
LDI r2, 46
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
