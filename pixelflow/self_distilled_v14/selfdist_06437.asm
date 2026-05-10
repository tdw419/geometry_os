; DESCRIPTION: Places a blue 17x78 box at position (377, 13).
; PLAN: r0=377(x), r1=13(y), r2=17(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 13
LDI r2, 17
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
