; DESCRIPTION: Places a magenta 23x89 box at position (231, 48).
; PLAN: r0=231(x), r1=48(y), r2=23(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 48
LDI r2, 23
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
