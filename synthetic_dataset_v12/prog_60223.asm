; DESCRIPTION: Renders a yellow line between points (75, 129) and (4, 11).
; PLAN: r0=75(x1), r1=129(y1), r2=4(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 129
LDI r2, 4
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
