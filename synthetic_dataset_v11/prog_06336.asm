; DESCRIPTION: Renders a red line between points (189, 5) and (36, 41).
; PLAN: r0=189(x1), r1=5(y1), r2=36(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 5
LDI r2, 36
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
