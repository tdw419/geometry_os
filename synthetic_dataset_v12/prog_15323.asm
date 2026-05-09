; DESCRIPTION: Renders a magenta line between points (489, 182) and (403, 251).
; PLAN: r0=489(x1), r1=182(y1), r2=403(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 182
LDI r2, 403
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
