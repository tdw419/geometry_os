; DESCRIPTION: Creates a blue rectangular region at (325, 65) spanning 17 by 26 pixels.
; PLAN: r0=325(x), r1=65(y), r2=17(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 65
LDI r2, 17
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
