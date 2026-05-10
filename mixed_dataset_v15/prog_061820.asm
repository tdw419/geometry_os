; DESCRIPTION: Renders a magenta line between points (388, 252) and (36, 229).
; PLAN: r0=388(x1), r1=252(y1), r2=36(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 252
LDI r2, 36
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
