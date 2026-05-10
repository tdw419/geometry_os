; DESCRIPTION: Renders a magenta line between points (308, 169) and (68, 83).
; PLAN: r0=308(x1), r1=169(y1), r2=68(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 169
LDI r2, 68
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
