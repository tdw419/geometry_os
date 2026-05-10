; DESCRIPTION: Draws a blue line from (352, 159) to (369, 251).
; PLAN: r0=352(x1), r1=159(y1), r2=369(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 159
LDI r2, 369
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
