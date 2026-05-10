; DESCRIPTION: Creates a blue filled rectangle of size 63x49 starting at (184, 131).
; PLAN: r0=184(x), r1=131(y), r2=63(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 131
LDI r2, 63
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
