; DESCRIPTION: Renders a green line between points (486, 25) and (363, 227).
; PLAN: r0=486(x1), r1=25(y1), r2=363(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 25
LDI r2, 363
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
