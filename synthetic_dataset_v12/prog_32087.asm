; DESCRIPTION: Draws a purple line from (455, 29) to (17, 61).
; PLAN: r0=455(x1), r1=29(y1), r2=17(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 29
LDI r2, 17
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
