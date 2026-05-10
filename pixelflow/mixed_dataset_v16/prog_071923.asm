; DESCRIPTION: Places a purple 80x33 rectangle at position (390, 219).
; PLAN: r0=390(x), r1=219(y), r2=80(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 219
LDI r2, 80
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
