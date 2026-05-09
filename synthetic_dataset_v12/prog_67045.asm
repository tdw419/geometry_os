; DESCRIPTION: Places a purple 97x107 rectangle at position (212, 25).
; PLAN: r0=212(x), r1=25(y), r2=97(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 25
LDI r2, 97
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
