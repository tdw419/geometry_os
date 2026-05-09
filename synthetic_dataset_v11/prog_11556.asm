; DESCRIPTION: Renders a yellow line between points (129, 220) and (205, 4).
; PLAN: r0=129(x1), r1=220(y1), r2=205(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 220
LDI r2, 205
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
