; DESCRIPTION: Renders a blue line between points (6, 197) and (132, 10).
; PLAN: r0=6(x1), r1=197(y1), r2=132(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 197
LDI r2, 132
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
