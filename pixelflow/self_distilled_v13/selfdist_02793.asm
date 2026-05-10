; DESCRIPTION: Places a blue 35x13 box at position (47, 135).
; PLAN: r0=47(x), r1=135(y), r2=35(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 135
LDI r2, 35
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
