; DESCRIPTION: Places a blue 25x20 rectangle at position (6, 110).
; PLAN: r0=6(x), r1=110(y), r2=25(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 110
LDI r2, 25
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
