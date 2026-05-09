; DESCRIPTION: Draws a blue line from (279, 147) to (107, 223).
; PLAN: r0=279(x1), r1=147(y1), r2=107(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 147
LDI r2, 107
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
