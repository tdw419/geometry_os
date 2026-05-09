; DESCRIPTION: Renders a white line between points (36, 185) and (97, 148).
; PLAN: r0=36(x1), r1=185(y1), r2=97(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 185
LDI r2, 97
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
