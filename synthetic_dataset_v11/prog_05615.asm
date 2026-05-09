; DESCRIPTION: Renders a green line between points (20, 123) and (45, 110).
; PLAN: r0=20(x1), r1=123(y1), r2=45(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 123
LDI r2, 45
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
