; DESCRIPTION: Renders a black line between points (260, 35) and (402, 165).
; PLAN: r0=260(x1), r1=35(y1), r2=402(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 35
LDI r2, 402
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
