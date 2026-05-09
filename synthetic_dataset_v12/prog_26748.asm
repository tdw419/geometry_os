; DESCRIPTION: Places a purple 108x84 rectangle at position (389, 78).
; PLAN: r0=389(x), r1=78(y), r2=108(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 78
LDI r2, 108
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
