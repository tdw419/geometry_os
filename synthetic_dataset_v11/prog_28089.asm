; DESCRIPTION: Creates a blue rectangular region at (161, 54) spanning 53 by 108 pixels.
; PLAN: r0=161(x), r1=54(y), r2=53(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 54
LDI r2, 53
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
