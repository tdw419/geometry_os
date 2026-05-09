; DESCRIPTION: Draws a purple line from (385, 63) to (254, 196).
; PLAN: r0=385(x1), r1=63(y1), r2=254(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 63
LDI r2, 254
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
