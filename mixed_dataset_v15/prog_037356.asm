; DESCRIPTION: Renders a blue line between points (130, 9) and (37, 121).
; PLAN: r0=130(x1), r1=9(y1), r2=37(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 9
LDI r2, 37
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
