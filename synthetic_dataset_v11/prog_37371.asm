; DESCRIPTION: Renders a red line between points (214, 76) and (251, 89).
; PLAN: r0=214(x1), r1=76(y1), r2=251(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 76
LDI r2, 251
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
