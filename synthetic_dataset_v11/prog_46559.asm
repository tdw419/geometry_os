; DESCRIPTION: Places a blue 63x106 rectangle at position (110, 70).
; PLAN: r0=110(x), r1=70(y), r2=63(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 70
LDI r2, 63
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
