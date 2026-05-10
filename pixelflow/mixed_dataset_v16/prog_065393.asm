; DESCRIPTION: Creates a magenta filled rectangle of size 32x51 starting at (334, 18).
; PLAN: r0=334(x), r1=18(y), r2=32(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 18
LDI r2, 32
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
