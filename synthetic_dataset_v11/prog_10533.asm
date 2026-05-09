; DESCRIPTION: Draws a blue line from (230, 38) to (248, 159).
; PLAN: r0=230(x1), r1=38(y1), r2=248(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 38
LDI r2, 248
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
