; DESCRIPTION: Creates a blue rectangular region at (124, 70) spanning 62 by 105 pixels.
; PLAN: r0=124(x), r1=70(y), r2=62(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 70
LDI r2, 62
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
