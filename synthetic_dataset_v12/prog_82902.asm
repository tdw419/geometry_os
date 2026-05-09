; DESCRIPTION: Places a purple 105x101 rectangle at position (160, 155).
; PLAN: r0=160(x), r1=155(y), r2=105(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 155
LDI r2, 105
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
