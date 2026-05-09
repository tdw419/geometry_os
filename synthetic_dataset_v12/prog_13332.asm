; DESCRIPTION: Renders a black line between points (369, 73) and (75, 37).
; PLAN: r0=369(x1), r1=73(y1), r2=75(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 73
LDI r2, 75
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
