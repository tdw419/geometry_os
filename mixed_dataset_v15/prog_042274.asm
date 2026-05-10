; DESCRIPTION: Creates a blue rectangular region at (89, 148) spanning 85 by 108 pixels.
; PLAN: r0=89(x), r1=148(y), r2=85(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 148
LDI r2, 85
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
