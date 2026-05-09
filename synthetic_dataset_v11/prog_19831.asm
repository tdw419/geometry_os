; DESCRIPTION: Renders a yellow line between points (50, 200) and (129, 19).
; PLAN: r0=50(x1), r1=200(y1), r2=129(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 200
LDI r2, 129
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
