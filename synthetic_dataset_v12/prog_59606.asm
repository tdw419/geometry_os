; DESCRIPTION: Places a magenta 31x93 rectangle at position (231, 145).
; PLAN: r0=231(x), r1=145(y), r2=31(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 145
LDI r2, 31
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
