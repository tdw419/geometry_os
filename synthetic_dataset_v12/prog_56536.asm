; DESCRIPTION: Renders a red line between points (89, 223) and (496, 9).
; PLAN: r0=89(x1), r1=223(y1), r2=496(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 223
LDI r2, 496
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
