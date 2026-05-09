; DESCRIPTION: Renders a blue line between points (113, 87) and (159, 65).
; PLAN: r0=113(x1), r1=87(y1), r2=159(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 87
LDI r2, 159
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
