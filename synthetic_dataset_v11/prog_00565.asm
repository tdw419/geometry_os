; DESCRIPTION: Renders a green line between points (129, 138) and (52, 10).
; PLAN: r0=129(x1), r1=138(y1), r2=52(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 138
LDI r2, 52
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
