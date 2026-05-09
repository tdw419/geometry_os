; DESCRIPTION: Renders a yellow line between points (377, 110) and (113, 197).
; PLAN: r0=377(x1), r1=110(y1), r2=113(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 110
LDI r2, 113
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
