; DESCRIPTION: Renders a blue line between points (45, 54) and (150, 88).
; PLAN: r0=45(x1), r1=54(y1), r2=150(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 54
LDI r2, 150
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
