; DESCRIPTION: Draws a magenta line from (277, 75) to (470, 221).
; PLAN: r0=277(x1), r1=75(y1), r2=470(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 75
LDI r2, 470
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
