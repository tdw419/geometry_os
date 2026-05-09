; DESCRIPTION: Creates a yellow rectangular region at (203, 3) spanning 24 by 97 pixels.
; PLAN: r0=203(x), r1=3(y), r2=24(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 3
LDI r2, 24
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
