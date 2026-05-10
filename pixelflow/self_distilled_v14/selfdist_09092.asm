; DESCRIPTION: Places a blue 105x89 box at position (115, 10).
; PLAN: r0=115(x), r1=10(y), r2=105(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 10
LDI r2, 105
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
