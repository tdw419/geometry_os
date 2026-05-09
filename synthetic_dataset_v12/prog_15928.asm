; DESCRIPTION: Renders a magenta line between points (48, 50) and (51, 229).
; PLAN: r0=48(x1), r1=50(y1), r2=51(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 50
LDI r2, 51
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
