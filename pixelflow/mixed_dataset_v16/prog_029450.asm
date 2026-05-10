; DESCRIPTION: Places a blue 44x63 rectangle at position (418, 105).
; PLAN: r0=418(x), r1=105(y), r2=44(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 105
LDI r2, 44
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
