; DESCRIPTION: Renders a black line between points (383, 75) and (158, 45).
; PLAN: r0=383(x1), r1=75(y1), r2=158(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 75
LDI r2, 158
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
