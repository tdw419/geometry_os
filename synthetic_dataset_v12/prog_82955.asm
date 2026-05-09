; DESCRIPTION: Renders a yellow line between points (463, 226) and (9, 131).
; PLAN: r0=463(x1), r1=226(y1), r2=9(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 226
LDI r2, 9
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
