; DESCRIPTION: Creates a green rectangular region at (44, 219) spanning 11 by 17 pixels.
; PLAN: r0=44(x), r1=219(y), r2=11(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 219
LDI r2, 11
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
