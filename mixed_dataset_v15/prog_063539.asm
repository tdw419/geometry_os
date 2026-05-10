; DESCRIPTION: Creates a blue rectangular region at (416, 97) spanning 88 by 108 pixels.
; PLAN: r0=416(x), r1=97(y), r2=88(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 97
LDI r2, 88
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
