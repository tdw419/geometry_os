; DESCRIPTION: Renders a blue line between points (130, 165) and (20, 184).
; PLAN: r0=130(x1), r1=165(y1), r2=20(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 165
LDI r2, 20
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
