; DESCRIPTION: Creates a blue rectangular region at (58, 175) spanning 84 by 55 pixels.
; PLAN: r0=58(x), r1=175(y), r2=84(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 175
LDI r2, 84
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
