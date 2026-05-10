; DESCRIPTION: Creates a magenta filled rectangle of size 89x79 starting at (355, 183).
; PLAN: r0=355(x), r1=183(y), r2=89(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 183
LDI r2, 89
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
