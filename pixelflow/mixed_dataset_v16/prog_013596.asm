; DESCRIPTION: Places a purple 47x19 box at position (145, 17).
; PLAN: r0=145(x), r1=17(y), r2=47(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 17
LDI r2, 47
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
