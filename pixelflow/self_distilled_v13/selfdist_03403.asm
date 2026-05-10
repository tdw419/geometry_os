; DESCRIPTION: Creates a blue filled rectangle of size 116x118 starting at (385, 79).
; PLAN: r0=385(x), r1=79(y), r2=116(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 79
LDI r2, 116
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
