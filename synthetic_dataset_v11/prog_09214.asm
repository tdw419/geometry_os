; DESCRIPTION: Renders a blue line between points (11, 251) and (109, 243).
; PLAN: r0=11(x1), r1=251(y1), r2=109(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 251
LDI r2, 109
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
