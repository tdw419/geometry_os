; DESCRIPTION: Renders a black line between points (334, 173) and (269, 110).
; PLAN: r0=334(x1), r1=173(y1), r2=269(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 173
LDI r2, 269
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
