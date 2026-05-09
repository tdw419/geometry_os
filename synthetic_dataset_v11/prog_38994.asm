; DESCRIPTION: Renders a yellow line between points (136, 35) and (102, 38).
; PLAN: r0=136(x1), r1=35(y1), r2=102(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 35
LDI r2, 102
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
