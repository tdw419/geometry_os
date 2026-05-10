; DESCRIPTION: Places a blue 23x26 box at position (390, 7).
; PLAN: r0=390(x), r1=7(y), r2=23(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 7
LDI r2, 23
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
