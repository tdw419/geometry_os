; DESCRIPTION: Renders a blue line between points (55, 21) and (226, 247).
; PLAN: r0=55(x1), r1=21(y1), r2=226(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 21
LDI r2, 226
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
