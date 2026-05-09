; DESCRIPTION: Places a blue 94x83 rectangle at position (163, 63).
; PLAN: r0=163(x), r1=63(y), r2=94(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 63
LDI r2, 94
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
