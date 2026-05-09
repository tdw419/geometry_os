; DESCRIPTION: Renders a yellow line between points (113, 47) and (129, 45).
; PLAN: r0=113(x1), r1=47(y1), r2=129(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 47
LDI r2, 129
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
