; DESCRIPTION: Renders a blue line between points (500, 202) and (481, 121).
; PLAN: r0=500(x1), r1=202(y1), r2=481(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 202
LDI r2, 481
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
