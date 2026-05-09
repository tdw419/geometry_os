; DESCRIPTION: Places a purple 19x63 rectangle at position (396, 157).
; PLAN: r0=396(x), r1=157(y), r2=19(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 157
LDI r2, 19
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
