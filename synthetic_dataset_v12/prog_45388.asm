; DESCRIPTION: Renders a yellow line between points (85, 75) and (383, 227).
; PLAN: r0=85(x1), r1=75(y1), r2=383(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 75
LDI r2, 383
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
