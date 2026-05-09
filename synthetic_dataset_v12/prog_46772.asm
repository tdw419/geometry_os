; DESCRIPTION: Creates a blue rectangular region at (345, 49) spanning 71 by 108 pixels.
; PLAN: r0=345(x), r1=49(y), r2=71(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 49
LDI r2, 71
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
