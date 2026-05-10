; DESCRIPTION: Renders a red line segment connecting (185, 37) to (132, 184).
; PLAN: r0=185(x1), r1=37(y1), r2=132(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 37
LDI r2, 132
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
