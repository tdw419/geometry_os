; DESCRIPTION: Renders a black line between points (148, 69) and (88, 159).
; PLAN: r0=148(x1), r1=69(y1), r2=88(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 69
LDI r2, 88
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
