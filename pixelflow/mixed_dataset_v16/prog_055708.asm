; DESCRIPTION: Creates a blue filled rectangle of size 89x14 starting at (189, 163).
; PLAN: r0=189(x), r1=163(y), r2=89(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 163
LDI r2, 89
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
