; DESCRIPTION: Draws a blue line from (447, 227) to (404, 6).
; PLAN: r0=447(x1), r1=227(y1), r2=404(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 227
LDI r2, 404
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
