; DESCRIPTION: Draws a purple line from (360, 200) to (475, 148).
; PLAN: r0=360(x1), r1=200(y1), r2=475(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 200
LDI r2, 475
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
