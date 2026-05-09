; DESCRIPTION: Renders a black line between points (253, 123) and (254, 200).
; PLAN: r0=253(x1), r1=123(y1), r2=254(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 123
LDI r2, 254
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
