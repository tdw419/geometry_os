; DESCRIPTION: Creates a blue rectangular region at (69, 53) spanning 105 by 88 pixels.
; PLAN: r0=69(x), r1=53(y), r2=105(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 53
LDI r2, 105
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
