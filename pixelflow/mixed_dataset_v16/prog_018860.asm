; DESCRIPTION: Renders a blue line between points (455, 162) and (308, 159).
; PLAN: r0=455(x1), r1=162(y1), r2=308(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 162
LDI r2, 308
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
