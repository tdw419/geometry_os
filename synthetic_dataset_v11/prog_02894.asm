; DESCRIPTION: Creates a blue rectangular region at (10, 101) spanning 19 by 114 pixels.
; PLAN: r0=10(x), r1=101(y), r2=19(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 101
LDI r2, 19
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
