; DESCRIPTION: Creates a blue filled rectangle of size 95x22 starting at (93, 30).
; PLAN: r0=93(x), r1=30(y), r2=95(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 30
LDI r2, 95
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
