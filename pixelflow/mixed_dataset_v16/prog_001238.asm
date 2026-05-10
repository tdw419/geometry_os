; DESCRIPTION: Creates a blue filled rectangle of size 58x112 starting at (99, 148).
; PLAN: r0=99(x), r1=148(y), r2=58(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 148
LDI r2, 58
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
