; DESCRIPTION: Renders a black line between points (39, 5) and (300, 78).
; PLAN: r0=39(x1), r1=5(y1), r2=300(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 5
LDI r2, 300
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
