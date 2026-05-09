; DESCRIPTION: Renders a black line between points (338, 233) and (145, 208).
; PLAN: r0=338(x1), r1=233(y1), r2=145(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 233
LDI r2, 145
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
