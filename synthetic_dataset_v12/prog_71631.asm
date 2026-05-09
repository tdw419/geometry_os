; DESCRIPTION: Renders a blue line between points (20, 178) and (9, 20).
; PLAN: r0=20(x1), r1=178(y1), r2=9(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 178
LDI r2, 9
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
