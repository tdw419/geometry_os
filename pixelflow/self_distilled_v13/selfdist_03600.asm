; DESCRIPTION: Places a blue 34x93 box at position (97, 15).
; PLAN: r0=97(x), r1=15(y), r2=34(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 15
LDI r2, 34
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
