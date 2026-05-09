; DESCRIPTION: Renders a green line between points (378, 38) and (323, 0).
; PLAN: r0=378(x1), r1=38(y1), r2=323(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 38
LDI r2, 323
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
