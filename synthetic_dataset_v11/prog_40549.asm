; DESCRIPTION: Renders a yellow line between points (89, 226) and (161, 223).
; PLAN: r0=89(x1), r1=226(y1), r2=161(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 226
LDI r2, 161
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
