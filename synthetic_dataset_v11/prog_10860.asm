; DESCRIPTION: Renders a black line between points (71, 6) and (90, 100).
; PLAN: r0=71(x1), r1=6(y1), r2=90(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 6
LDI r2, 90
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
