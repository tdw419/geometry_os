; DESCRIPTION: Creates a blue filled rectangle of size 96x32 starting at (137, 72).
; PLAN: r0=137(x), r1=72(y), r2=96(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 72
LDI r2, 96
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
