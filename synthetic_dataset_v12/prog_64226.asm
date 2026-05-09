; DESCRIPTION: Draws a blue line from (124, 230) to (296, 247).
; PLAN: r0=124(x1), r1=230(y1), r2=296(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 230
LDI r2, 296
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
