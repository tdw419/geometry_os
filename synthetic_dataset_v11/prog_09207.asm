; DESCRIPTION: Creates a blue rectangular region at (5, 123) spanning 110 by 111 pixels.
; PLAN: r0=5(x), r1=123(y), r2=110(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 123
LDI r2, 110
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
