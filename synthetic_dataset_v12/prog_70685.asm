; DESCRIPTION: Draws a blue line from (347, 189) to (24, 233).
; PLAN: r0=347(x1), r1=189(y1), r2=24(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 189
LDI r2, 24
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
