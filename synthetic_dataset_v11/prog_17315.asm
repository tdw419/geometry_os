; DESCRIPTION: Renders a black line between points (217, 159) and (112, 140).
; PLAN: r0=217(x1), r1=159(y1), r2=112(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 159
LDI r2, 112
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
