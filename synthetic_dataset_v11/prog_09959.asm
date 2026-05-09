; DESCRIPTION: Renders a blue line between points (91, 8) and (221, 254).
; PLAN: r0=91(x1), r1=8(y1), r2=221(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 8
LDI r2, 221
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
