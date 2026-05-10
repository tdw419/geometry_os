; DESCRIPTION: Renders a yellow line between points (41, 30) and (218, 131).
; PLAN: r0=41(x1), r1=30(y1), r2=218(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 30
LDI r2, 218
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
