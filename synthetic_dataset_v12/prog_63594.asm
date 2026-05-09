; DESCRIPTION: Creates a green rectangular region at (407, 108) spanning 43 by 56 pixels.
; PLAN: r0=407(x), r1=108(y), r2=43(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 108
LDI r2, 43
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
