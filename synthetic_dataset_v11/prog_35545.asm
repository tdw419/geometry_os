; DESCRIPTION: Draws a purple line from (223, 250) to (98, 121).
; PLAN: r0=223(x1), r1=250(y1), r2=98(x2), r3=121(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 250
LDI r2, 98
LDI r3, 121
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
