; DESCRIPTION: Draws a blue line from (326, 104) to (169, 160).
; PLAN: r0=326(x1), r1=104(y1), r2=169(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 104
LDI r2, 169
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
