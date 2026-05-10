; DESCRIPTION: Creates a magenta filled rectangle of size 93x13 starting at (153, 100).
; PLAN: r0=153(x), r1=100(y), r2=93(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 100
LDI r2, 93
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
