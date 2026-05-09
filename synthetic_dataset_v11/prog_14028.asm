; DESCRIPTION: Creates a blue rectangular region at (22, 53) spanning 98 by 101 pixels.
; PLAN: r0=22(x), r1=53(y), r2=98(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 53
LDI r2, 98
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
