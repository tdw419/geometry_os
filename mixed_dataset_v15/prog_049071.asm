; DESCRIPTION: Renders a red line between points (229, 52) and (143, 18).
; PLAN: r0=229(x1), r1=52(y1), r2=143(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 52
LDI r2, 143
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
