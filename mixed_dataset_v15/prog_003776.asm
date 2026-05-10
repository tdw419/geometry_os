; DESCRIPTION: Draws a blue line from (247, 248) to (266, 159).
; PLAN: r0=247(x1), r1=248(y1), r2=266(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 248
LDI r2, 266
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
