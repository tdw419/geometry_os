; DESCRIPTION: Creates a blue rectangular region at (76, 17) spanning 30 by 108 pixels.
; PLAN: r0=76(x), r1=17(y), r2=30(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 17
LDI r2, 30
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
