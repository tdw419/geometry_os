; DESCRIPTION: Renders a red line between points (234, 2) and (80, 159).
; PLAN: r0=234(x1), r1=2(y1), r2=80(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 2
LDI r2, 80
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
