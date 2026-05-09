; DESCRIPTION: Renders a red line between points (5, 29) and (234, 78).
; PLAN: r0=5(x1), r1=29(y1), r2=234(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 29
LDI r2, 234
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
