; DESCRIPTION: Creates a blue filled rectangle of size 81x84 starting at (14, 98).
; PLAN: r0=14(x), r1=98(y), r2=81(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 98
LDI r2, 81
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
