; DESCRIPTION: Renders a red line between points (110, 89) and (108, 234).
; PLAN: r0=110(x1), r1=89(y1), r2=108(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 89
LDI r2, 108
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
