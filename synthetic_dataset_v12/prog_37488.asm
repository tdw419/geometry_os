; DESCRIPTION: Renders a black line between points (490, 29) and (285, 233).
; PLAN: r0=490(x1), r1=29(y1), r2=285(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 29
LDI r2, 285
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
