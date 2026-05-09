; DESCRIPTION: Renders a magenta line between points (221, 211) and (250, 186).
; PLAN: r0=221(x1), r1=211(y1), r2=250(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 211
LDI r2, 250
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
