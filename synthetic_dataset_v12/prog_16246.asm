; DESCRIPTION: Creates a green rectangular region at (454, 185) spanning 31 by 59 pixels.
; PLAN: r0=454(x), r1=185(y), r2=31(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 185
LDI r2, 31
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
