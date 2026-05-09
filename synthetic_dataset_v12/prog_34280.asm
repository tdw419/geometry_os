; DESCRIPTION: Draws a magenta line from (216, 80) to (347, 197).
; PLAN: r0=216(x1), r1=80(y1), r2=347(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 80
LDI r2, 347
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
