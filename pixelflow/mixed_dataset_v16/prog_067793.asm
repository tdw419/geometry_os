; DESCRIPTION: Creates a magenta filled rectangle of size 31x118 starting at (367, 197).
; PLAN: r0=367(x), r1=197(y), r2=31(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 197
LDI r2, 31
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
