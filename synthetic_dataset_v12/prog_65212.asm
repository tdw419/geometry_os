; DESCRIPTION: Draws a purple line from (63, 37) to (385, 234).
; PLAN: r0=63(x1), r1=37(y1), r2=385(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 37
LDI r2, 385
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
