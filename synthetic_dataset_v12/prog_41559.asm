; DESCRIPTION: Renders a yellow line between points (233, 125) and (435, 136).
; PLAN: r0=233(x1), r1=125(y1), r2=435(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 125
LDI r2, 435
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
