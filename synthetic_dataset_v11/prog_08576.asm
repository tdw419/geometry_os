; DESCRIPTION: Draws a purple line from (225, 223) to (250, 159).
; PLAN: r0=225(x1), r1=223(y1), r2=250(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 223
LDI r2, 250
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
