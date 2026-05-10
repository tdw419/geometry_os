; DESCRIPTION: Places a magenta 118x16 box at position (291, 87).
; PLAN: r0=291(x), r1=87(y), r2=118(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 87
LDI r2, 118
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
