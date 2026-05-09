; DESCRIPTION: Draws a magenta line from (36, 219) to (200, 23).
; PLAN: r0=36(x1), r1=219(y1), r2=200(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 219
LDI r2, 200
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
