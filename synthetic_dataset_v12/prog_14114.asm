; DESCRIPTION: Draws a magenta line from (500, 90) to (221, 150).
; PLAN: r0=500(x1), r1=90(y1), r2=221(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 90
LDI r2, 221
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
