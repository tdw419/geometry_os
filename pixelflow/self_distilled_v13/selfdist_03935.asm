; DESCRIPTION: Places a purple 39x11 box at position (107, 185).
; PLAN: r0=107(x), r1=185(y), r2=39(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 185
LDI r2, 39
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
