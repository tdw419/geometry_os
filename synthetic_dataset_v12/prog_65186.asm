; DESCRIPTION: Places a blue 23x22 rectangle at position (483, 3).
; PLAN: r0=483(x), r1=3(y), r2=23(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 3
LDI r2, 23
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
