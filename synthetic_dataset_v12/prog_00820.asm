; DESCRIPTION: Renders a blue line between points (463, 219) and (5, 88).
; PLAN: r0=463(x1), r1=219(y1), r2=5(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 219
LDI r2, 5
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
