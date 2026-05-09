; DESCRIPTION: Renders a blue line between points (103, 11) and (142, 46).
; PLAN: r0=103(x1), r1=11(y1), r2=142(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 11
LDI r2, 142
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
