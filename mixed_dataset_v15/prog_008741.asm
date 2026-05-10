; DESCRIPTION: Renders a black line between points (272, 217) and (369, 20).
; PLAN: r0=272(x1), r1=217(y1), r2=369(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 217
LDI r2, 369
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
