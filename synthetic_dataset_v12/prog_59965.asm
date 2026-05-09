; DESCRIPTION: Renders a blue line between points (265, 132) and (18, 119).
; PLAN: r0=265(x1), r1=132(y1), r2=18(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 132
LDI r2, 18
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
