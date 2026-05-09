; DESCRIPTION: Renders a magenta line between points (501, 247) and (466, 211).
; PLAN: r0=501(x1), r1=247(y1), r2=466(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 247
LDI r2, 466
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
