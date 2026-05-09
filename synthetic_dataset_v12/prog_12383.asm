; DESCRIPTION: Renders a black line between points (251, 158) and (433, 162).
; PLAN: r0=251(x1), r1=158(y1), r2=433(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 158
LDI r2, 433
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
