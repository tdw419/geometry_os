; DESCRIPTION: Renders a white line between points (251, 176) and (323, 9).
; PLAN: r0=251(x1), r1=176(y1), r2=323(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 176
LDI r2, 323
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
