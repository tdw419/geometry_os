; DESCRIPTION: Renders a yellow line between points (104, 211) and (174, 158).
; PLAN: r0=104(x1), r1=211(y1), r2=174(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 211
LDI r2, 174
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
