; DESCRIPTION: Renders a green line between points (27, 211) and (129, 29).
; PLAN: r0=27(x1), r1=211(y1), r2=129(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 211
LDI r2, 129
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
