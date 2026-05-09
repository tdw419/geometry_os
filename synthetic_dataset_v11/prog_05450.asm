; DESCRIPTION: Creates a blue rectangular region at (22, 181) spanning 62 by 35 pixels.
; PLAN: r0=22(x), r1=181(y), r2=62(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 181
LDI r2, 62
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
