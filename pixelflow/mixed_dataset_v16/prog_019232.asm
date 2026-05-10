; DESCRIPTION: Creates a blue rectangular region at (278, 155) spanning 98 by 73 pixels.
; PLAN: r0=278(x), r1=155(y), r2=98(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 155
LDI r2, 98
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
