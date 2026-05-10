; DESCRIPTION: Creates a magenta filled rectangle of size 119x87 starting at (87, 68).
; PLAN: r0=87(x), r1=68(y), r2=119(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 68
LDI r2, 119
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
