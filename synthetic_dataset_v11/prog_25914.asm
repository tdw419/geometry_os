; DESCRIPTION: Renders a yellow line between points (31, 165) and (80, 220).
; PLAN: r0=31(x1), r1=165(y1), r2=80(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 165
LDI r2, 80
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
