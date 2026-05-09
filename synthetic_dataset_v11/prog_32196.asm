; DESCRIPTION: Renders a yellow line between points (7, 81) and (5, 160).
; PLAN: r0=7(x1), r1=81(y1), r2=5(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 81
LDI r2, 5
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
