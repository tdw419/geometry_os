; DESCRIPTION: Renders a magenta line between points (432, 19) and (145, 161).
; PLAN: r0=432(x1), r1=19(y1), r2=145(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 19
LDI r2, 145
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
