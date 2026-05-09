; DESCRIPTION: Creates a blue rectangular region at (114, 70) spanning 69 by 110 pixels.
; PLAN: r0=114(x), r1=70(y), r2=69(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 70
LDI r2, 69
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
