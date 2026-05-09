; DESCRIPTION: Creates a blue rectangular region at (88, 108) spanning 28 by 38 pixels.
; PLAN: r0=88(x), r1=108(y), r2=28(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 108
LDI r2, 28
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
