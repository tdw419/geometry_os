; DESCRIPTION: Places a blue 84x26 rectangle at position (8, 35).
; PLAN: r0=8(x), r1=35(y), r2=84(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 35
LDI r2, 84
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
