; DESCRIPTION: Creates a blue rectangular region at (144, 200) spanning 56 by 49 pixels.
; PLAN: r0=144(x), r1=200(y), r2=56(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 200
LDI r2, 56
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
