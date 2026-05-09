; DESCRIPTION: Renders a blue line between points (17, 144) and (101, 146).
; PLAN: r0=17(x1), r1=144(y1), r2=101(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 144
LDI r2, 101
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
