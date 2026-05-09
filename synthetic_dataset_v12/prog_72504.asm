; DESCRIPTION: Draws a magenta line from (162, 181) to (400, 131).
; PLAN: r0=162(x1), r1=181(y1), r2=400(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 181
LDI r2, 400
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
