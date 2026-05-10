; DESCRIPTION: Places a blue 94x84 box at position (89, 149).
; PLAN: r0=89(x), r1=149(y), r2=94(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 149
LDI r2, 94
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
