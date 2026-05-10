; DESCRIPTION: Places a blue 13x87 box at position (149, 135).
; PLAN: r0=149(x), r1=135(y), r2=13(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 135
LDI r2, 13
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
