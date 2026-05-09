; DESCRIPTION: Renders a blue line between points (223, 209) and (477, 237).
; PLAN: r0=223(x1), r1=209(y1), r2=477(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 209
LDI r2, 477
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
