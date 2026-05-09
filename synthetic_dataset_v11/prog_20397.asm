; DESCRIPTION: Renders a blue line between points (19, 89) and (120, 146).
; PLAN: r0=19(x1), r1=89(y1), r2=120(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 89
LDI r2, 120
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
