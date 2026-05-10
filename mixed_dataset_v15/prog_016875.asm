; DESCRIPTION: Renders a white line between points (221, 251) and (486, 130).
; PLAN: r0=221(x1), r1=251(y1), r2=486(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 251
LDI r2, 486
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
