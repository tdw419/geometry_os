; DESCRIPTION: Places a magenta 87x118 box at position (149, 67).
; PLAN: r0=149(x), r1=67(y), r2=87(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 67
LDI r2, 87
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
