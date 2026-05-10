; DESCRIPTION: Draws a magenta line from (393, 140) to (200, 88).
; PLAN: r0=393(x1), r1=140(y1), r2=200(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 140
LDI r2, 200
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
