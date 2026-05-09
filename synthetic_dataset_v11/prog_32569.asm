; DESCRIPTION: Renders a blue line between points (108, 20) and (121, 9).
; PLAN: r0=108(x1), r1=20(y1), r2=121(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 20
LDI r2, 121
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
