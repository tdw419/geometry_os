; DESCRIPTION: Creates a blue filled rectangle of size 28x23 starting at (200, 62).
; PLAN: r0=200(x), r1=62(y), r2=28(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 62
LDI r2, 28
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
