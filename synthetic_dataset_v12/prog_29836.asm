; DESCRIPTION: Draws a magenta line from (500, 160) to (362, 10).
; PLAN: r0=500(x1), r1=160(y1), r2=362(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 160
LDI r2, 362
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
