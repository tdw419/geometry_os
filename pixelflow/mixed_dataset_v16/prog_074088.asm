; DESCRIPTION: Places a blue 54x101 box at position (155, 133).
; PLAN: r0=155(x), r1=133(y), r2=54(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 133
LDI r2, 54
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
