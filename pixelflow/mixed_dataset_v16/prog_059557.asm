; DESCRIPTION: Places a blue 45x83 box at position (321, 94).
; PLAN: r0=321(x), r1=94(y), r2=45(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 94
LDI r2, 45
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
