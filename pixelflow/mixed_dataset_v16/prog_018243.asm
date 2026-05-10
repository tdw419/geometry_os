; DESCRIPTION: Renders a red line between points (265, 245) and (132, 80).
; PLAN: r0=265(x1), r1=245(y1), r2=132(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 245
LDI r2, 132
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
