; DESCRIPTION: Renders a green line between points (313, 145) and (139, 131).
; PLAN: r0=313(x1), r1=145(y1), r2=139(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 145
LDI r2, 139
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
