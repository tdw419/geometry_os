; DESCRIPTION: Draws a blue line from (43, 229) to (185, 112).
; PLAN: r0=43(x1), r1=229(y1), r2=185(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 229
LDI r2, 185
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
