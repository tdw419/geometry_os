; DESCRIPTION: Places a purple 52x52 box at position (44, 127).
; PLAN: r0=44(x), r1=127(y), r2=52(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 127
LDI r2, 52
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
