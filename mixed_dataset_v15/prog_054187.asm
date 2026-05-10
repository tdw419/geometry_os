; DESCRIPTION: Renders a blue line between points (435, 241) and (270, 193).
; PLAN: r0=435(x1), r1=241(y1), r2=270(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 241
LDI r2, 270
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
