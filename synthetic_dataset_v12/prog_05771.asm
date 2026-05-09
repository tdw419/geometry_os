; DESCRIPTION: Renders a blue line between points (303, 77) and (432, 50).
; PLAN: r0=303(x1), r1=77(y1), r2=432(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 77
LDI r2, 432
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
