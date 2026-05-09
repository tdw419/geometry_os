; DESCRIPTION: Places a blue 100x25 rectangle at position (9, 145).
; PLAN: r0=9(x), r1=145(y), r2=100(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 145
LDI r2, 100
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
