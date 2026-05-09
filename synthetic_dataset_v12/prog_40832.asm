; DESCRIPTION: Creates a green rectangular region at (97, 148) spanning 40 by 18 pixels.
; PLAN: r0=97(x), r1=148(y), r2=40(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 148
LDI r2, 40
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
