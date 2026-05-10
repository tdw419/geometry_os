; DESCRIPTION: Renders a blue line segment connecting (146, 75) to (260, 15).
; PLAN: r0=146(x1), r1=75(y1), r2=260(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 75
LDI r2, 260
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
