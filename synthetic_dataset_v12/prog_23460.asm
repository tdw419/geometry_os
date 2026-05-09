; DESCRIPTION: Renders a white line between points (347, 17) and (325, 175).
; PLAN: r0=347(x1), r1=17(y1), r2=325(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 17
LDI r2, 325
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
