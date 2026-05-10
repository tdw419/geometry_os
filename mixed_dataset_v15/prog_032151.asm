; DESCRIPTION: Renders a blue line between points (254, 10) and (4, 11).
; PLAN: r0=254(x1), r1=10(y1), r2=4(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 10
LDI r2, 4
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
