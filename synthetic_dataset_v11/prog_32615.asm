; DESCRIPTION: Creates a blue rectangular region at (144, 78) spanning 62 by 23 pixels.
; PLAN: r0=144(x), r1=78(y), r2=62(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 78
LDI r2, 62
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
