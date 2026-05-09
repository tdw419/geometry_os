; DESCRIPTION: Creates a blue rectangular region at (30, 100) spanning 118 by 76 pixels.
; PLAN: r0=30(x), r1=100(y), r2=118(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 100
LDI r2, 118
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
