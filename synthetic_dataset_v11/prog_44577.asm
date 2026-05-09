; DESCRIPTION: Creates a blue rectangular region at (141, 44) spanning 88 by 111 pixels.
; PLAN: r0=141(x), r1=44(y), r2=88(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 44
LDI r2, 88
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
