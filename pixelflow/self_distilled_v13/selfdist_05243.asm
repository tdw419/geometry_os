; DESCRIPTION: Places a blue 84x87 box at position (299, 145).
; PLAN: r0=299(x), r1=145(y), r2=84(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 145
LDI r2, 84
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
