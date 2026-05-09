; DESCRIPTION: Renders a black line between points (88, 140) and (154, 142).
; PLAN: r0=88(x1), r1=140(y1), r2=154(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 140
LDI r2, 154
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
