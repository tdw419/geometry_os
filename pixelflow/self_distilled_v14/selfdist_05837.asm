; DESCRIPTION: Creates a magenta filled rectangle of size 77x13 starting at (365, 58).
; PLAN: r0=365(x), r1=58(y), r2=77(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 58
LDI r2, 77
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
