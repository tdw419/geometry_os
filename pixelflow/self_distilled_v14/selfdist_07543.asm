; DESCRIPTION: Places a purple 26x14 box at position (272, 24).
; PLAN: r0=272(x), r1=24(y), r2=26(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 24
LDI r2, 26
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
