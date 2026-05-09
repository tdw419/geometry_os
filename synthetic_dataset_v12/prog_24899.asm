; DESCRIPTION: Renders a yellow line between points (252, 233) and (85, 131).
; PLAN: r0=252(x1), r1=233(y1), r2=85(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 233
LDI r2, 85
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
