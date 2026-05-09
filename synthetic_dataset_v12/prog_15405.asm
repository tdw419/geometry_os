; DESCRIPTION: Places a purple 98x71 rectangle at position (390, 64).
; PLAN: r0=390(x), r1=64(y), r2=98(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 64
LDI r2, 98
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
