; DESCRIPTION: Creates a blue rectangular region at (366, 160) spanning 97 by 31 pixels.
; PLAN: r0=366(x), r1=160(y), r2=97(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 160
LDI r2, 97
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
