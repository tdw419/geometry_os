; DESCRIPTION: Renders a white line between points (286, 118) and (189, 136).
; PLAN: r0=286(x1), r1=118(y1), r2=189(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 118
LDI r2, 189
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
