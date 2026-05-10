; DESCRIPTION: Draws a blue line from (347, 80) to (221, 198).
; PLAN: r0=347(x1), r1=80(y1), r2=221(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 80
LDI r2, 221
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
