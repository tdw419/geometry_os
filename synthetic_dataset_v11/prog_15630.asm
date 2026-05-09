; DESCRIPTION: Renders a magenta line between points (186, 50) and (118, 253).
; PLAN: r0=186(x1), r1=50(y1), r2=118(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 50
LDI r2, 118
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
