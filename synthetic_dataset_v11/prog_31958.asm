; DESCRIPTION: Draws a magenta line from (233, 229) to (83, 140).
; PLAN: r0=233(x1), r1=229(y1), r2=83(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 229
LDI r2, 83
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
