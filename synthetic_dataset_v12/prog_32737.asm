; DESCRIPTION: Draws a white line from (105, 181) to (147, 197).
; PLAN: r0=105(x1), r1=181(y1), r2=147(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 181
LDI r2, 147
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
