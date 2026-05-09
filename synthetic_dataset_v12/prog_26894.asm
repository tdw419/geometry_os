; DESCRIPTION: Creates a blue rectangular region at (127, 119) spanning 14 by 69 pixels.
; PLAN: r0=127(x), r1=119(y), r2=14(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 119
LDI r2, 14
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
