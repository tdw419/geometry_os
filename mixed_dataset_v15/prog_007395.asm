; DESCRIPTION: Renders a black line between points (85, 3) and (5, 55).
; PLAN: r0=85(x1), r1=3(y1), r2=5(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 3
LDI r2, 5
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
