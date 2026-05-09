; DESCRIPTION: Renders a blue line between points (207, 169) and (146, 137).
; PLAN: r0=207(x1), r1=169(y1), r2=146(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 169
LDI r2, 146
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
