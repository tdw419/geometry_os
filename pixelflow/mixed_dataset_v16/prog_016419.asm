; DESCRIPTION: Places a purple 63x107 rectangle at position (86, 66).
; PLAN: r0=86(x), r1=66(y), r2=63(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 66
LDI r2, 63
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
