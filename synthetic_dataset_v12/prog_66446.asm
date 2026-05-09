; DESCRIPTION: Renders a magenta line between points (114, 15) and (140, 229).
; PLAN: r0=114(x1), r1=15(y1), r2=140(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 15
LDI r2, 140
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
