; DESCRIPTION: Renders a magenta line between points (362, 10) and (503, 75).
; PLAN: r0=362(x1), r1=10(y1), r2=503(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 10
LDI r2, 503
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
