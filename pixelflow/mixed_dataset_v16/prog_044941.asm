; DESCRIPTION: Places a blue 81x66 box at position (375, 80).
; PLAN: r0=375(x), r1=80(y), r2=81(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 80
LDI r2, 81
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
