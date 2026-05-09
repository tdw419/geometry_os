; DESCRIPTION: Creates a green rectangular region at (489, 8) spanning 17 by 69 pixels.
; PLAN: r0=489(x), r1=8(y), r2=17(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 8
LDI r2, 17
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
