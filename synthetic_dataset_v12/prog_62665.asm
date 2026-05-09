; DESCRIPTION: Renders a white line between points (130, 147) and (313, 114).
; PLAN: r0=130(x1), r1=147(y1), r2=313(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 147
LDI r2, 313
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
