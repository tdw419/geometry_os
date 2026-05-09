; DESCRIPTION: Renders a green line between points (36, 229) and (377, 129).
; PLAN: r0=36(x1), r1=229(y1), r2=377(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 229
LDI r2, 377
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
