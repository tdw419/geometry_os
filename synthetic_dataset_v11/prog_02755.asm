; DESCRIPTION: Renders a red line between points (234, 110) and (157, 3).
; PLAN: r0=234(x1), r1=110(y1), r2=157(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 110
LDI r2, 157
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
