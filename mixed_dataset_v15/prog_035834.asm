; DESCRIPTION: Creates a magenta filled rectangle of size 32x119 starting at (99, 45).
; PLAN: r0=99(x), r1=45(y), r2=32(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 45
LDI r2, 32
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
