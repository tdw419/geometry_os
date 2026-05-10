; DESCRIPTION: Creates a magenta filled rectangle of size 34x89 starting at (190, 145).
; PLAN: r0=190(x), r1=145(y), r2=34(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 145
LDI r2, 34
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
