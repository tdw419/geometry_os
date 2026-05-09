; DESCRIPTION: Places a blue 14x83 rectangle at position (347, 159).
; PLAN: r0=347(x), r1=159(y), r2=14(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 159
LDI r2, 14
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
