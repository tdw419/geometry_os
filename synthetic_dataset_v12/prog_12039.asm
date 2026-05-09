; DESCRIPTION: Creates a blue rectangular region at (185, 89) spanning 62 by 76 pixels.
; PLAN: r0=185(x), r1=89(y), r2=62(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 89
LDI r2, 62
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
