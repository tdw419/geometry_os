; DESCRIPTION: Renders a white line between points (462, 169) and (368, 8).
; PLAN: r0=462(x1), r1=169(y1), r2=368(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 169
LDI r2, 368
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
