; DESCRIPTION: Places a purple 14x19 rectangle at position (219, 163).
; PLAN: r0=219(x), r1=163(y), r2=14(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 163
LDI r2, 14
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
