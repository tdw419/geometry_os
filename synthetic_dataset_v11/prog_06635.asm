; DESCRIPTION: Renders a green line between points (2, 229) and (101, 17).
; PLAN: r0=2(x1), r1=229(y1), r2=101(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 229
LDI r2, 101
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
