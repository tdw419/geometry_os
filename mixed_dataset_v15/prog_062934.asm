; DESCRIPTION: Places a purple 26x24 box at position (283, 160).
; PLAN: r0=283(x), r1=160(y), r2=26(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 160
LDI r2, 26
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
