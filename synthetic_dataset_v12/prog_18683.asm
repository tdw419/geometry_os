; DESCRIPTION: Renders a black line between points (491, 21) and (466, 137).
; PLAN: r0=491(x1), r1=21(y1), r2=466(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 21
LDI r2, 466
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
