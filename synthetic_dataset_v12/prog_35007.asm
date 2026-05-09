; DESCRIPTION: Renders a white line between points (220, 169) and (474, 181).
; PLAN: r0=220(x1), r1=169(y1), r2=474(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 169
LDI r2, 474
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
