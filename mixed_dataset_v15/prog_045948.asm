; DESCRIPTION: Creates a blue rectangular region at (349, 65) spanning 110 by 108 pixels.
; PLAN: r0=349(x), r1=65(y), r2=110(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 65
LDI r2, 110
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
