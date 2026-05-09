; DESCRIPTION: Renders a white line between points (363, 51) and (170, 99).
; PLAN: r0=363(x1), r1=51(y1), r2=170(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 51
LDI r2, 170
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
