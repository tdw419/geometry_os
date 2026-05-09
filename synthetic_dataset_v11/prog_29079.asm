; DESCRIPTION: Renders a red line between points (211, 164) and (2, 162).
; PLAN: r0=211(x1), r1=164(y1), r2=2(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 164
LDI r2, 2
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
