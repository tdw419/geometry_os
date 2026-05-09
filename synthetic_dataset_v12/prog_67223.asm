; DESCRIPTION: Creates a blue rectangular region at (36, 60) spanning 26 by 84 pixels.
; PLAN: r0=36(x), r1=60(y), r2=26(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 60
LDI r2, 26
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
