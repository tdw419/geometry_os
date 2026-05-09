; DESCRIPTION: Creates a blue rectangular region at (190, 88) spanning 23 by 120 pixels.
; PLAN: r0=190(x), r1=88(y), r2=23(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 88
LDI r2, 23
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
