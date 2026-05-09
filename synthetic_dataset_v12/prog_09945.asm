; DESCRIPTION: Places a purple 66x63 rectangle at position (385, 81).
; PLAN: r0=385(x), r1=81(y), r2=66(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 81
LDI r2, 66
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
