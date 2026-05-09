; DESCRIPTION: Creates a green rectangular region at (160, 227) spanning 61 by 26 pixels.
; PLAN: r0=160(x), r1=227(y), r2=61(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 227
LDI r2, 61
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
