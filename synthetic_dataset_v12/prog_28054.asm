; DESCRIPTION: Creates a blue rectangular region at (102, 99) spanning 97 by 112 pixels.
; PLAN: r0=102(x), r1=99(y), r2=97(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 99
LDI r2, 97
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
