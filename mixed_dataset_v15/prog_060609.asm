; DESCRIPTION: Renders a black line between points (369, 25) and (71, 69).
; PLAN: r0=369(x1), r1=25(y1), r2=71(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 25
LDI r2, 71
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
