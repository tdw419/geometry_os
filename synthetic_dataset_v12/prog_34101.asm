; DESCRIPTION: Draws a purple line from (391, 18) to (254, 163).
; PLAN: r0=391(x1), r1=18(y1), r2=254(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 18
LDI r2, 254
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
