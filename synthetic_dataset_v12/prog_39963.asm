; DESCRIPTION: Renders a blue line between points (377, 209) and (498, 109).
; PLAN: r0=377(x1), r1=209(y1), r2=498(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 209
LDI r2, 498
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
