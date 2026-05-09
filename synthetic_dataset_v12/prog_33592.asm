; DESCRIPTION: Renders a magenta line between points (75, 159) and (441, 168).
; PLAN: r0=75(x1), r1=159(y1), r2=441(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 159
LDI r2, 441
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
