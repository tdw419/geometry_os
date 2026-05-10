; DESCRIPTION: Places a magenta 51x22 box at position (231, 115).
; PLAN: r0=231(x), r1=115(y), r2=51(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 115
LDI r2, 51
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
