; DESCRIPTION: Renders a blue line between points (270, 188) and (17, 10).
; PLAN: r0=270(x1), r1=188(y1), r2=17(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 188
LDI r2, 17
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
