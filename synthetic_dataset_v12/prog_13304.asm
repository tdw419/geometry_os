; DESCRIPTION: Draws a magenta line from (164, 1) to (500, 89).
; PLAN: r0=164(x1), r1=1(y1), r2=500(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 1
LDI r2, 500
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
