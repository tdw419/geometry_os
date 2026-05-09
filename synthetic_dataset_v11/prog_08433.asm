; DESCRIPTION: Creates a blue rectangular region at (13, 132) spanning 36 by 56 pixels.
; PLAN: r0=13(x), r1=132(y), r2=36(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 132
LDI r2, 36
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
