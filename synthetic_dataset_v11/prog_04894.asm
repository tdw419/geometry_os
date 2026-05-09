; DESCRIPTION: Renders a white line between points (40, 169) and (122, 91).
; PLAN: r0=40(x1), r1=169(y1), r2=122(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 169
LDI r2, 122
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
