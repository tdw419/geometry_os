; DESCRIPTION: Creates a blue rectangular region at (88, 14) spanning 114 by 55 pixels.
; PLAN: r0=88(x), r1=14(y), r2=114(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 14
LDI r2, 114
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
