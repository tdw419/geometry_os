; DESCRIPTION: Renders a yellow line between points (490, 123) and (45, 207).
; PLAN: r0=490(x1), r1=123(y1), r2=45(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 123
LDI r2, 45
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
