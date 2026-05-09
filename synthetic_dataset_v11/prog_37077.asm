; DESCRIPTION: Renders a blue line between points (129, 242) and (249, 131).
; PLAN: r0=129(x1), r1=242(y1), r2=249(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 242
LDI r2, 249
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
