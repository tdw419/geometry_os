; DESCRIPTION: Renders a blue line between points (2, 10) and (237, 177).
; PLAN: r0=2(x1), r1=10(y1), r2=237(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 10
LDI r2, 237
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
