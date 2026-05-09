; DESCRIPTION: Renders a magenta line between points (148, 155) and (300, 241).
; PLAN: r0=148(x1), r1=155(y1), r2=300(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 155
LDI r2, 300
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
