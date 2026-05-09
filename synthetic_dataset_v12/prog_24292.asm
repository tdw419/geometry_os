; DESCRIPTION: Renders a black line between points (325, 150) and (54, 253).
; PLAN: r0=325(x1), r1=150(y1), r2=54(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 150
LDI r2, 54
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
