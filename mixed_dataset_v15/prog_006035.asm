; DESCRIPTION: Creates a blue filled rectangle of size 101x102 starting at (244, 152).
; PLAN: r0=244(x), r1=152(y), r2=101(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 152
LDI r2, 101
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
