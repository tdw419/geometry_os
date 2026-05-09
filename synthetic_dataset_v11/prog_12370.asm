; DESCRIPTION: Renders a blue line between points (132, 99) and (212, 25).
; PLAN: r0=132(x1), r1=99(y1), r2=212(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 99
LDI r2, 212
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
