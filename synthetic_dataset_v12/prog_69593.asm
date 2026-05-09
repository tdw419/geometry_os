; DESCRIPTION: Renders a magenta line between points (404, 93) and (119, 194).
; PLAN: r0=404(x1), r1=93(y1), r2=119(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 93
LDI r2, 119
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
