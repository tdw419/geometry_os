; DESCRIPTION: Renders a magenta line between points (162, 177) and (419, 75).
; PLAN: r0=162(x1), r1=177(y1), r2=419(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 177
LDI r2, 419
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
