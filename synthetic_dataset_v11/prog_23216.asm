; DESCRIPTION: Creates a green rectangular region at (83, 59) spanning 62 by 84 pixels.
; PLAN: r0=83(x), r1=59(y), r2=62(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 59
LDI r2, 62
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
