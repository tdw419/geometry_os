; DESCRIPTION: Places a purple 90x39 box at position (133, 97).
; PLAN: r0=133(x), r1=97(y), r2=90(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 97
LDI r2, 90
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
