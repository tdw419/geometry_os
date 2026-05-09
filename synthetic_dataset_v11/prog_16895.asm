; DESCRIPTION: Creates a blue rectangular region at (169, 148) spanning 62 by 80 pixels.
; PLAN: r0=169(x), r1=148(y), r2=62(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 148
LDI r2, 62
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
