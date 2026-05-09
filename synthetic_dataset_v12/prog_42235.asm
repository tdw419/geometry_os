; DESCRIPTION: Renders a purple line between points (360, 110) and (311, 175).
; PLAN: r0=360(x1), r1=110(y1), r2=311(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 110
LDI r2, 311
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
