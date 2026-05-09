; DESCRIPTION: Creates a blue rectangular region at (24, 87) spanning 84 by 97 pixels.
; PLAN: r0=24(x), r1=87(y), r2=84(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 87
LDI r2, 84
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
