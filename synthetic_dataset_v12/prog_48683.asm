; DESCRIPTION: Renders a yellow line between points (81, 9) and (118, 6).
; PLAN: r0=81(x1), r1=9(y1), r2=118(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 9
LDI r2, 118
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
