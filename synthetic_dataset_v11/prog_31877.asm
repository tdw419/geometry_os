; DESCRIPTION: Renders a blue line between points (184, 25) and (99, 188).
; PLAN: r0=184(x1), r1=25(y1), r2=99(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 25
LDI r2, 99
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
