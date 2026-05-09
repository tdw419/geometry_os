; DESCRIPTION: Renders a black line between points (125, 148) and (158, 6).
; PLAN: r0=125(x1), r1=148(y1), r2=158(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 148
LDI r2, 158
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
