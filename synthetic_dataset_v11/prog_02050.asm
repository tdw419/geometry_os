; DESCRIPTION: Renders a blue line between points (232, 25) and (8, 91).
; PLAN: r0=232(x1), r1=25(y1), r2=8(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 25
LDI r2, 8
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
