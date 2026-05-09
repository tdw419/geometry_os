; DESCRIPTION: Renders a blue line between points (65, 165) and (498, 94).
; PLAN: r0=65(x1), r1=165(y1), r2=498(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 165
LDI r2, 498
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
