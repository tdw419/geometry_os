; DESCRIPTION: Renders a red line between points (129, 252) and (144, 225).
; PLAN: r0=129(x1), r1=252(y1), r2=144(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 252
LDI r2, 144
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
