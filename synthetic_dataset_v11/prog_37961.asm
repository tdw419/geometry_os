; DESCRIPTION: Renders a magenta line between points (95, 145) and (186, 24).
; PLAN: r0=95(x1), r1=145(y1), r2=186(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 145
LDI r2, 186
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
