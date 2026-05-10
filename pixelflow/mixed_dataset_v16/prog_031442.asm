; DESCRIPTION: Renders a red line between points (191, 159) and (325, 189).
; PLAN: r0=191(x1), r1=159(y1), r2=325(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 159
LDI r2, 325
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
