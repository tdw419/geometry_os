; DESCRIPTION: Creates a blue filled rectangle of size 22x34 starting at (12, 64).
; PLAN: r0=12(x), r1=64(y), r2=22(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 64
LDI r2, 22
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
