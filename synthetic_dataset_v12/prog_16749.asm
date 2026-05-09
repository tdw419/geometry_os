; DESCRIPTION: Creates a blue rectangular region at (331, 100) spanning 59 by 17 pixels.
; PLAN: r0=331(x), r1=100(y), r2=59(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 100
LDI r2, 59
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
