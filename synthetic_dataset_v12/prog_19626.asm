; DESCRIPTION: Renders a black line between points (5, 166) and (0, 119).
; PLAN: r0=5(x1), r1=166(y1), r2=0(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 166
LDI r2, 0
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
