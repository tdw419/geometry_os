; DESCRIPTION: Places a purple 97x83 rectangle at position (223, 4).
; PLAN: r0=223(x), r1=4(y), r2=97(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 4
LDI r2, 97
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
