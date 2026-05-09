; DESCRIPTION: Renders a red line between points (366, 40) and (251, 184).
; PLAN: r0=366(x1), r1=40(y1), r2=251(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 40
LDI r2, 251
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
