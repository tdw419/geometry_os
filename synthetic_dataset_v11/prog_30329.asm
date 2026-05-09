; DESCRIPTION: Renders a magenta line between points (186, 163) and (183, 148).
; PLAN: r0=186(x1), r1=163(y1), r2=183(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 163
LDI r2, 183
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
