; DESCRIPTION: Renders a blue line between points (388, 202) and (41, 133).
; PLAN: r0=388(x1), r1=202(y1), r2=41(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 202
LDI r2, 41
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
