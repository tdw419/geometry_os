; DESCRIPTION: Draws a purple line from (411, 160) to (221, 240).
; PLAN: r0=411(x1), r1=160(y1), r2=221(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 160
LDI r2, 221
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
