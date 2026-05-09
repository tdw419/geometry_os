; DESCRIPTION: Places a magenta 10x89 rectangle at position (37, 80).
; PLAN: r0=37(x), r1=80(y), r2=10(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 80
LDI r2, 10
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
