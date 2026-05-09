; DESCRIPTION: Renders a white line between points (159, 109) and (143, 155).
; PLAN: r0=159(x1), r1=109(y1), r2=143(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 109
LDI r2, 143
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
