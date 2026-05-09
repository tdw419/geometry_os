; DESCRIPTION: Renders a blue line between points (11, 193) and (100, 120).
; PLAN: r0=11(x1), r1=193(y1), r2=100(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 193
LDI r2, 100
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
