; DESCRIPTION: Places a purple 56x83 rectangle at position (351, 2).
; PLAN: r0=351(x), r1=2(y), r2=56(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 2
LDI r2, 56
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
