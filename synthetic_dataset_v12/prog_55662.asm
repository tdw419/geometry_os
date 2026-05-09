; DESCRIPTION: Renders a blue line between points (168, 89) and (269, 9).
; PLAN: r0=168(x1), r1=89(y1), r2=269(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 89
LDI r2, 269
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
