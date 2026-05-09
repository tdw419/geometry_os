; DESCRIPTION: Renders a blue line between points (140, 84) and (53, 253).
; PLAN: r0=140(x1), r1=84(y1), r2=53(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 84
LDI r2, 53
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
