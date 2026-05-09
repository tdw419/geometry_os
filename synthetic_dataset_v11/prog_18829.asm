; DESCRIPTION: Creates a blue rectangular region at (132, 85) spanning 33 by 111 pixels.
; PLAN: r0=132(x), r1=85(y), r2=33(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 85
LDI r2, 33
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
