; DESCRIPTION: Creates a blue filled rectangle of size 11x73 starting at (232, 58).
; PLAN: r0=232(x), r1=58(y), r2=11(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 58
LDI r2, 11
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
