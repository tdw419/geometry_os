; DESCRIPTION: Renders a yellow line between points (250, 5) and (140, 229).
; PLAN: r0=250(x1), r1=5(y1), r2=140(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 5
LDI r2, 140
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
