; DESCRIPTION: Creates a blue rectangular region at (231, 23) spanning 60 by 84 pixels.
; PLAN: r0=231(x), r1=23(y), r2=60(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 23
LDI r2, 60
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
