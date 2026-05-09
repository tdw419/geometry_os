; DESCRIPTION: Creates a blue rectangular region at (19, 34) spanning 101 by 37 pixels.
; PLAN: r0=19(x), r1=34(y), r2=101(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 34
LDI r2, 101
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
