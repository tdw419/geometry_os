; DESCRIPTION: Renders a yellow line between points (4, 162) and (21, 230).
; PLAN: r0=4(x1), r1=162(y1), r2=21(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 162
LDI r2, 21
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
