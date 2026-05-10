; DESCRIPTION: Creates a green rectangular region at (351, 162) spanning 59 by 44 pixels.
; PLAN: r0=351(x), r1=162(y), r2=59(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 162
LDI r2, 59
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
