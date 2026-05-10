; DESCRIPTION: Renders a black line between points (454, 34) and (96, 203).
; PLAN: r0=454(x1), r1=34(y1), r2=96(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 34
LDI r2, 96
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
