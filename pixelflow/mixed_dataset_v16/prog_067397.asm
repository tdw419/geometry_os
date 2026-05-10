; DESCRIPTION: Creates a blue rectangular region at (159, 70) spanning 88 by 116 pixels.
; PLAN: r0=159(x), r1=70(y), r2=88(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 70
LDI r2, 88
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
