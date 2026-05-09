; DESCRIPTION: Draws a magenta line from (277, 80) to (55, 221).
; PLAN: r0=277(x1), r1=80(y1), r2=55(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 80
LDI r2, 55
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
