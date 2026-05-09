; DESCRIPTION: Creates a yellow rectangular region at (373, 91) spanning 81 by 56 pixels.
; PLAN: r0=373(x), r1=91(y), r2=81(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 91
LDI r2, 81
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
