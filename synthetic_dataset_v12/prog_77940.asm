; DESCRIPTION: Renders a blue line between points (188, 91) and (345, 124).
; PLAN: r0=188(x1), r1=91(y1), r2=345(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 91
LDI r2, 345
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
