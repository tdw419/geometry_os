; DESCRIPTION: Renders a magenta line between points (186, 218) and (37, 143).
; PLAN: r0=186(x1), r1=218(y1), r2=37(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 218
LDI r2, 37
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
