; DESCRIPTION: Creates a blue rectangular region at (2, 134) spanning 100 by 88 pixels.
; PLAN: r0=2(x), r1=134(y), r2=100(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 134
LDI r2, 100
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
