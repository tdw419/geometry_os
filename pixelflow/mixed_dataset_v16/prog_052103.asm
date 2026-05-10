; DESCRIPTION: Renders a blue line between points (273, 137) and (254, 35).
; PLAN: r0=273(x1), r1=137(y1), r2=254(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 137
LDI r2, 254
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
