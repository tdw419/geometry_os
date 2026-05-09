; DESCRIPTION: Places a purple 85x93 rectangle at position (19, 63).
; PLAN: r0=19(x), r1=63(y), r2=85(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 63
LDI r2, 85
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
