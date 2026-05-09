; DESCRIPTION: Renders a blue line between points (14, 19) and (207, 35).
; PLAN: r0=14(x1), r1=19(y1), r2=207(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 19
LDI r2, 207
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
