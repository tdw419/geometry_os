; DESCRIPTION: Creates a blue rectangular region at (390, 159) spanning 13 by 26 pixels.
; PLAN: r0=390(x), r1=159(y), r2=13(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 159
LDI r2, 13
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
