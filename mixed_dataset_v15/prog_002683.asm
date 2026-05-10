; DESCRIPTION: Creates a blue rectangular region at (141, 108) spanning 102 by 69 pixels.
; PLAN: r0=141(x), r1=108(y), r2=102(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 108
LDI r2, 102
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
