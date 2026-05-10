; DESCRIPTION: Creates a purple filled rectangle of size 47x101 starting at (356, 117).
; PLAN: r0=356(x), r1=117(y), r2=47(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 117
LDI r2, 47
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
