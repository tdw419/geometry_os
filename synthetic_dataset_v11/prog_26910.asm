; DESCRIPTION: Places a blue 20x91 rectangle at position (220, 145).
; PLAN: r0=220(x), r1=145(y), r2=20(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 145
LDI r2, 20
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
