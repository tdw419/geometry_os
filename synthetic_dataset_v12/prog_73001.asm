; DESCRIPTION: Renders a purple line between points (404, 132) and (486, 229).
; PLAN: r0=404(x1), r1=132(y1), r2=486(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 132
LDI r2, 486
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
