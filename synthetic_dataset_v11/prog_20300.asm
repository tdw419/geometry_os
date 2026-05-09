; DESCRIPTION: Renders a yellow line between points (176, 75) and (197, 119).
; PLAN: r0=176(x1), r1=75(y1), r2=197(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 75
LDI r2, 197
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
