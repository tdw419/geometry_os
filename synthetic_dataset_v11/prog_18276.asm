; DESCRIPTION: Places a purple 63x71 rectangle at position (66, 110).
; PLAN: r0=66(x), r1=110(y), r2=63(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 110
LDI r2, 63
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
