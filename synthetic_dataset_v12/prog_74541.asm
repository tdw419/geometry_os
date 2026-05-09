; DESCRIPTION: Places a purple 22x37 rectangle at position (371, 110).
; PLAN: r0=371(x), r1=110(y), r2=22(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 110
LDI r2, 22
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
