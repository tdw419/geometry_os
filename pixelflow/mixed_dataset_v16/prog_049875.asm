; DESCRIPTION: Renders a blue line between points (372, 133) and (68, 24).
; PLAN: r0=372(x1), r1=133(y1), r2=68(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 133
LDI r2, 68
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
