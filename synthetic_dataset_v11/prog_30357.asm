; DESCRIPTION: Draws a purple line from (36, 189) to (220, 208).
; PLAN: r0=36(x1), r1=189(y1), r2=220(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 189
LDI r2, 220
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
