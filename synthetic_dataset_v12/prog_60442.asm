; DESCRIPTION: Renders a magenta line between points (347, 146) and (75, 229).
; PLAN: r0=347(x1), r1=146(y1), r2=75(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 146
LDI r2, 75
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
