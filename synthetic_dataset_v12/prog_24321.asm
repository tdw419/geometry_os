; DESCRIPTION: Renders a black line between points (447, 155) and (312, 208).
; PLAN: r0=447(x1), r1=155(y1), r2=312(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 155
LDI r2, 312
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
