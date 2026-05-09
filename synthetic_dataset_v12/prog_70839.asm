; DESCRIPTION: Renders a blue line between points (396, 114) and (464, 50).
; PLAN: r0=396(x1), r1=114(y1), r2=464(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 114
LDI r2, 464
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
