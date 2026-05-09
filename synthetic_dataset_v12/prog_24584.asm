; DESCRIPTION: Renders a white line between points (486, 52) and (426, 99).
; PLAN: r0=486(x1), r1=52(y1), r2=426(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 52
LDI r2, 426
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
