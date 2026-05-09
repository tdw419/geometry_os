; DESCRIPTION: Renders a black line between points (408, 18) and (181, 80).
; PLAN: r0=408(x1), r1=18(y1), r2=181(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 18
LDI r2, 181
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
