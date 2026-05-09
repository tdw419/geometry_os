; DESCRIPTION: Renders a blue line between points (0, 145) and (78, 171).
; PLAN: r0=0(x1), r1=145(y1), r2=78(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 145
LDI r2, 78
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
