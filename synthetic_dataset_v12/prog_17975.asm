; DESCRIPTION: Creates a blue rectangular region at (93, 7) spanning 22 by 20 pixels.
; PLAN: r0=93(x), r1=7(y), r2=22(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 7
LDI r2, 22
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
