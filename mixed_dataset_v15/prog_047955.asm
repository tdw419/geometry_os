; DESCRIPTION: Creates a blue rectangular region at (157, 48) spanning 69 by 119 pixels.
; PLAN: r0=157(x), r1=48(y), r2=69(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 48
LDI r2, 69
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
