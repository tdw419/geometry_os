; DESCRIPTION: Renders a red line between points (9, 162) and (18, 80).
; PLAN: r0=9(x1), r1=162(y1), r2=18(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 162
LDI r2, 18
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
