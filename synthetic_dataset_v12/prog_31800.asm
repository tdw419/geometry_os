; DESCRIPTION: Draws a magenta line from (266, 129) to (393, 77).
; PLAN: r0=266(x1), r1=129(y1), r2=393(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 129
LDI r2, 393
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
