; DESCRIPTION: Creates a yellow rectangular region at (52, 152) spanning 78 by 97 pixels.
; PLAN: r0=52(x), r1=152(y), r2=78(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 152
LDI r2, 78
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
