; DESCRIPTION: Draws a blue line from (470, 190) to (505, 221).
; PLAN: r0=470(x1), r1=190(y1), r2=505(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 190
LDI r2, 505
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
