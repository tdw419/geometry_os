; DESCRIPTION: Places a purple 34x57 box at position (354, 13).
; PLAN: r0=354(x), r1=13(y), r2=34(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 13
LDI r2, 34
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
