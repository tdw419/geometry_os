; DESCRIPTION: Creates a blue rectangular region at (84, 150) spanning 22 by 39 pixels.
; PLAN: r0=84(x), r1=150(y), r2=22(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 150
LDI r2, 22
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
