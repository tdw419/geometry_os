; DESCRIPTION: Renders a yellow line between points (355, 89) and (329, 131).
; PLAN: r0=355(x1), r1=89(y1), r2=329(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 89
LDI r2, 329
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
