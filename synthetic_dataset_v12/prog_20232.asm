; DESCRIPTION: Renders a blue line between points (14, 18) and (400, 20).
; PLAN: r0=14(x1), r1=18(y1), r2=400(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 18
LDI r2, 400
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
