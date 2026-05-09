; DESCRIPTION: Renders a white line between points (107, 169) and (221, 6).
; PLAN: r0=107(x1), r1=169(y1), r2=221(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 169
LDI r2, 221
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
