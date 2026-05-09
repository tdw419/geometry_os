; DESCRIPTION: Renders a blue line between points (398, 162) and (291, 185).
; PLAN: r0=398(x1), r1=162(y1), r2=291(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 162
LDI r2, 291
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
