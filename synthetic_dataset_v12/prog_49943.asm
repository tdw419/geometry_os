; DESCRIPTION: Draws a magenta line from (389, 155) to (277, 120).
; PLAN: r0=389(x1), r1=155(y1), r2=277(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 155
LDI r2, 277
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
