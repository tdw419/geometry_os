; DESCRIPTION: Renders a blue line between points (170, 243) and (132, 54).
; PLAN: r0=170(x1), r1=243(y1), r2=132(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 243
LDI r2, 132
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
