; DESCRIPTION: Renders a green line between points (358, 169) and (332, 26).
; PLAN: r0=358(x1), r1=169(y1), r2=332(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 169
LDI r2, 332
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
