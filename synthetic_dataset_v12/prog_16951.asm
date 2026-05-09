; DESCRIPTION: Creates a blue rectangular region at (124, 43) spanning 35 by 114 pixels.
; PLAN: r0=124(x), r1=43(y), r2=35(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 43
LDI r2, 35
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
