; DESCRIPTION: Renders a blue line between points (104, 4) and (140, 20).
; PLAN: r0=104(x1), r1=4(y1), r2=140(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 4
LDI r2, 140
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
