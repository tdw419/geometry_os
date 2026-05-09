; DESCRIPTION: Renders a blue line between points (150, 105) and (31, 4).
; PLAN: r0=150(x1), r1=105(y1), r2=31(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 105
LDI r2, 31
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
