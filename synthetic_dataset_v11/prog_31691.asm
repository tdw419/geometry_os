; DESCRIPTION: Renders a blue line between points (29, 229) and (204, 193).
; PLAN: r0=29(x1), r1=229(y1), r2=204(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 229
LDI r2, 204
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
