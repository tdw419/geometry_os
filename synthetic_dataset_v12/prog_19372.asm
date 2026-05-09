; DESCRIPTION: Creates a blue rectangular region at (62, 20) spanning 107 by 108 pixels.
; PLAN: r0=62(x), r1=20(y), r2=107(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 20
LDI r2, 107
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
