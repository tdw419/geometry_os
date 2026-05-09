; DESCRIPTION: Places a purple 63x61 rectangle at position (163, 52).
; PLAN: r0=163(x), r1=52(y), r2=63(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 52
LDI r2, 63
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
