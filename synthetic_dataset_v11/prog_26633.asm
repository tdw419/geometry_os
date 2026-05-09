; DESCRIPTION: Places a blue 79x83 rectangle at position (175, 84).
; PLAN: r0=175(x), r1=84(y), r2=79(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 84
LDI r2, 79
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
