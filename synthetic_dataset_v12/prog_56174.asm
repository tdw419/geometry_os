; DESCRIPTION: Creates a green rectangular region at (476, 56) spanning 29 by 97 pixels.
; PLAN: r0=476(x), r1=56(y), r2=29(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 56
LDI r2, 29
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
