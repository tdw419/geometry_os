; DESCRIPTION: Creates a blue rectangular region at (43, 149) spanning 73 by 88 pixels.
; PLAN: r0=43(x), r1=149(y), r2=73(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 149
LDI r2, 73
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
