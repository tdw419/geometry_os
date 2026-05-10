; DESCRIPTION: Renders a black line between points (131, 95) and (259, 137).
; PLAN: r0=131(x1), r1=95(y1), r2=259(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 95
LDI r2, 259
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
