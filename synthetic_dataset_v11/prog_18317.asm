; DESCRIPTION: Renders a yellow line between points (175, 7) and (89, 121).
; PLAN: r0=175(x1), r1=7(y1), r2=89(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 7
LDI r2, 89
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
