; DESCRIPTION: Renders a yellow line between points (186, 189) and (86, 5).
; PLAN: r0=186(x1), r1=189(y1), r2=86(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 189
LDI r2, 86
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
